import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:nepek_buyer/library/sync/product_classification.dart';
import 'package:nepek_buyer/pages/add_listing/main.dart';
import 'package:nepek_buyer/savedData/apis.dart';
import 'package:nepek_buyer/savedData/httpUri.dart';
import 'package:nepek_buyer/savedData/user_data.dart';
import 'package:nepek_buyer/styles/popUps/errorPopup.dart';
import 'package:nepek_buyer/styles/popUps/loading_popup.dart';
import 'package:nepek_buyer/styles/popUps/sucessPopup.dart';
import 'package:nepek_buyer/styles/spinkit.dart';
import 'package:nepek_buyer/styles/toasts/sucess_toast.dart';
import 'frontend/inject_datas.dart';
import 'package:http/http.dart' as http;

class ListingData with ChangeNotifier {
  Widget body = logoLoader();
  bool syncedClassification = false;
  final _backend = BackEnd();
  Box classificationBox = Hive.box('classifications');
  int currentScreen = 1;
  Map data;
  Map currentDetails;
  Map currentClassification;
  Map commission;
  List currentSpecifications;
  List currentOptions;
  List currentImages;
  Map miniThumb;
  List variants;
  var productData;
  List sendingOptions;

  void init() {
    SyncClassification().sync().then((_) {
      syncedClassification = true;
      body = AddListingForm();
      notifyListeners();
    });
    // });
  }

  void injectSpecs(String subCategoryID) {
    final List allSpecs = classificationBox.get('specifications');
    currentSpecifications = allSpecs
        .where((element) => element['subcategory_id'] == subCategoryID)
        .toList();
    notifyListeners();
  }

  dynamic setNextScreen(BuildContext context, int no) {
    if (no == 2) {
      _getCommission();
      injectSpecs(currentClassification['subcategory']['_id']);
    }
    currentScreen = no;
    notifyListeners();
  }

  _getCommission() {
    final selectedCategory = currentClassification['category'];

    commission = {
      'marketplace_fee': selectedCategory['marketplace_fee'],
      'sales_vat_fee': selectedCategory['sales_vat_fee'],
      'payment_processing_fee': selectedCategory['payment_processing_fee'],
      'total_fee': selectedCategory['total_fee'],
    };

    print(commission);
  }

  injectListingData() {
    productData = InjectDatas().getBackendData(
      currentDetails,
      currentClassification,
      currentSpecifications,
      currentOptions,
      commission,
      variants,
      currentImages,
      miniThumb,
    );
  }

  sendData(context) {
    loadingPopUP(context, "Adding Product");

    var optImgs;
    if (checkOptionsImage())
      optImgs =
          currentOptions.firstWhere((opt) => opt['name'] == 'Color Group');

    final imgDir = productData['imgDir'];
    _backend
        .sendImage(
      currentImages,
      'images',
      imgDir,
      'null',
      context,
    )
        .then((_) {
      _backend.sendImage(
        [miniThumb],
        'miniThumbnail',
        imgDir,
        'null',
        context,
      ).then((_) {
        if (currentOptions.length != 0) {
          _backend
              .sendImage(
            optImgs['value'],
            'options',
            imgDir,
            optImgs['imgKey'],
            context,
          )
              .then((_) {
            _backend.sendData(
              productData,
              context,
            );
          });
        } else {
          _backend.sendData(
            productData,
            context,
          );
        }
      });
    });

    // _backend.sendData(productData).then((id) {
    //   final imageData = productData['imageData'];
    //   _backend.sendImage(imageData['thumb'], "thumb", id).then((_) {
    //     _backend.sendImage(imageData['miniThumb'], 'miniThumb', id).then((_) {
    //       _backend.sendImage(imageData['img1'], 'other', id).then((_) {
    //         _backend.sendImage(imageData['img2'], 'other', id).then((_) {
    //           _backend.sendImage(imageData['img3'], 'other', id).then((_) {
    //             _backend.sendImage(imageData['img4'], 'other', id).then((_) {
    //               Navigator.of(context).pop();
    //               Navigator.of(context).pop();
    //               sucessFulPopup(context, "Added product");
    //             });
    //           });
    //         });
    //       });
    //     });
    //   });
    // });
  }

  bool checkOptionsImage() {
    if (currentOptions.length == 0) return false;
    for (var opt in currentOptions)
      if (opt['name'] == 'Color Group') return true;
    return false;
  }
}

// const OptionsSchema = new mongoose.Schema({
//   name: String,
//   value: Array,
//   default: String,
//   imageKey: String,
// })

// const VariantsSchema = new mongoose.Schema({
//   variants: Array,
//   qty: Number,
//   price: Number
// })

// const ProductSchema = new mongoose.Schema({
//   imgDir: String,
//   seller_id: String,
// date_posted: Date,
//   clicks: Number,
//   sold: Number,
//   storeName: String,
//   storeType: Number,
//   show: Boolean,
//   productName: String,
//   searchString: String,
//   tags: Array,
//   price: Number,
//   oldPrice: Number,
//   changedPriceAt: Date,
//   deduction: Number,
//   thumbnail: String,
//   miniThumb: String,
//   imgs: Array,
//   brand: String,
//   classs: String,
//   category: String,
//   subcategory: String,
//   classLabel: String,
//   categoryLabel: String,
//   subCategoryLabel: String,
//   rating: Number,
//   ratingNo: Number,
//   highlights: Array,
//   specifications: Array,
//   qty: Number,
//   rating: Number,
//   ratingNo: Number,
//   options: [OptionsSchema],
//   variants: [VariantsSchema],
// });

class BackEnd {
  Future sendData(
    Map productData,
    context,
  ) async {
    var response = await http.post(
      httpUri(serviceTwo, 'products/cr_up_dl/add'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${UserPreferences().getJwtToken()}'
      },
      body: jsonEncode(productData),
    );

    if (response.statusCode == 200) {
      Navigator.of(context).pop();
      Navigator.of(context).pop();
      sucessToast(context, "Added Product");
      sucessFulPopup(context, "Product Sucessfully Added");
    } else {
      Navigator.of(context).pop();
      Navigator.of(context).pop();
      errorPopup(
        context,
        'Some error occured durning adding product\nPlease contact us ASAP',
      );
    }
  }

  Future sendImage(List imgs, type, imgDir, optDir, context) async {
    Map<String, String> headers = {
      "Authorization": 'Bearer ${UserPreferences().getJwtToken()}',
    };

    String imageUploadUrl =
        '$serviceTwo/products/cr_up_dl/upload?imgDir=$imgDir&type=$type&no=${imgs.length}';

    if (type == 'options') {
      imageUploadUrl =
          '$serviceTwo/products/cr_up_dl/upload?imgDir=$imgDir&type=$type&no=${imgs.length}&optDir=$optDir';
    }
    final imageUpload =
        http.MultipartRequest('POST', Uri.parse(imageUploadUrl));
    imageUpload.headers.addAll(headers);

    for (var img in imgs) {
      final image = await http.MultipartFile.fromPath('image', img['imgPath']);
      imageUpload.files.add(image);
    }

    final response = await imageUpload.send();

    if (response.statusCode == 200) {
      deleteImage(imgs);
    }

    if (response.statusCode != 200) {
      Navigator.of(context).pop();
      Navigator.of(context).pop();
      errorPopup(
        context,
        'Some error occured durning adding product\nPlease contact us ASAP',
      );
    }
  }

  void deleteImage(List imgs) async {
    for (var img in imgs) {
      await File(img['imgPath']).delete(recursive: true);
    }
  }
}
