import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nepek_buyer/functions/token_header.dart';
import 'package:nepek_buyer/pages/products/give_review/layout/main.dart';
import 'package:nepek_buyer/savedData/apis.dart';
import 'package:nepek_buyer/savedData/httpUri.dart';
import 'package:nepek_buyer/styles/popUps/errorPopUp.dart';
import 'package:nepek_buyer/styles/popUps/loading_popup.dart';
import 'package:nepek_buyer/styles/spinkit.dart';
import 'package:nepek_buyer/styles/toasts/sucess_toast.dart';
import 'package:uuid/uuid.dart';
import 'layout/add_image/camera_gallery.dart';
import 'layout/add_image/img_container.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';

var uuid = Uuid();

class GiveReviewProvider with ChangeNotifier {
  bool askedCameraOrGallery = false;
  ImageSource source = ImageSource.gallery;
  bool firstAdded = false;
  final picker = ImagePicker();
  List<Widget> addImage = [];
  Map miniThumb;
  List imagePaths = [];
  AddBackend _backend = AddBackend();
  bool initFetched = false;
  bool isaddImage = false;
  var refreshBack;
  Widget body = logoLoader();
  Map product = {};
  String id;
  String review = '';
  int rating = 1;

  Future getProduct() async {
    final res = await get(
      httpUri(serviceOne, 'buy_system/buyer/to_review?type=single&id=$id'),
      headers: tokenHeader(),
    );
    product = jsonDecode(res.body);

    body = GiveReviewLayout();
    initFetched = true;
    notifyListeners();
  }

  void addFirst() {
    addImage = [];
    imagePaths = [];
    addImg();
    firstAdded = true;
  }

  void addAnother(BuildContext context) {
    if (addImage.length == 2)
      errorPopup(context, 'You connot add more than \ntwo images');
    else {
      addImg();
      notifyListeners();
    }
  }

  void addImg() {
    imagePaths.add({'imgPath': '', 'imgName': ''});
    final add = AddImage(
      index: addImage.length,
    );
    addImage.add(add);
  }

  void setImg(String path, int index, String imgName) {
    print(index);
    for (var imgpath in imagePaths) {
      if (imagePaths.indexOf(imgpath) == index) {
        imgpath['imgPath'] = path;
        imgpath['imgName'] = imgName;
      }
    }

    notifyListeners();
  }

  void deleteImage(imgname) async {
    await imgname.delete(recursive: true);
  }

  void camOrGalleryAsk(int index, BuildContext context) {
    sync() {
      Navigator.of(context).pop();
      askedCameraOrGallery = true;
      getImageFromDevice(index, context);
    }

    cameraOrGallery(context, () {
      source = ImageSource.camera;
      sync();
    }, () {
      source = ImageSource.gallery;
      sync();
    });
  }

  void getImageFromDevice(int index, BuildContext context) async {
    if (!askedCameraOrGallery) {
      camOrGalleryAsk(index, context);
    } else {
      PickedFile image =
          await picker.getImage(source: source, imageQuality: 100);
      print(image);
      final croppedFile = image;
      print(image);
      if (croppedFile != null) {
        File compressedImage = await FlutterNativeImage.compressImage(
          croppedFile.path,
          quality: 50,
          percentage: 30,
        );
        String filename = basename(compressedImage.path);
        setImg(compressedImage.path, index, filename);
      }
      deleteImage(File(image.path));
    }
  }

  addReviewImage() {
    isaddImage = true;
    notifyListeners();
  }

  Future addReview(BuildContext context, List imgs) async {
    List imgNames = [];
    for (var img in imgs) imgNames.add(img['imgName']);

    done() {
      Navigator.pop(context);
      Navigator.pop(context);
      refreshBack();
      sucessToast(context, 'Added Review');
    }

    if (review.length == 0)
      errorPopup(context, 'Write a review first !');
    else {
      loadingPopUP(context, 'Adding Review');
      final String imgKey = uuid.v4();
      final data = {
        'review': review,
        'sellerID': product['sellerID'],
        'rating': rating,
        'productID': product['productID'],
        'imgKey': imgKey,
        'imgs': imgNames,
        'buySysID': product['_id']
      };
      _backend.addReview(data).then((status) {
        if (status == 200) {
          if (imgs.length > 0)
            _backend.sendImage(imgs, imgKey, context).then((status) {
              if (status == 200) done();
            });
          else
            done();
        }
      });
    }
  }
}

class AddBackend {
  Future addReview(Map data) async {
    final response = await put(
      httpUri(serviceTwo, 'reviews/buyer/give_review'),
      body: jsonEncode(data),
      headers: tokenHeaderContentType(),
    );
    return response.statusCode;
  }

  Future sendImage(List imgs, imgDir, context) async {
    // const key = req.query.key
    // const no = parseInt(req.query.no);
// /reviews/buyer/give_review
//
//
// const key = req.query.key
    final no = imgs.length;

    final String imageUploadUrl =
        '$serviceTwo/reviews/buyer/upload?no=$no&key=$imgDir';

    final imageUpload = MultipartRequest('POST', Uri.parse(imageUploadUrl));
    imageUpload.headers.addAll(tokenHeader());

    for (var img in imgs) {
      final image = await MultipartFile.fromPath('image', img['imgPath']);
      imageUpload.files.add(image);
    }

    final response = await imageUpload.send();

    if (response.statusCode == 200) {
      deleteImage(imgs);
      return 200;
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
