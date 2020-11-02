import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:skite_buyer/pages/viewProduct/view_product_layout.dart';
import 'dart:convert';
import 'package:skite_buyer/savedData/apis.dart';

import 'package:skite_buyer/styles/spinkit.dart';

class ViewProductState with ChangeNotifier {
  final cart = Hive.box('cart');

  String productID;
  bool initialFetch = false;
  dynamic result = spinkit;
  List productImgs;
  String miniThumb;
  String productUid;
  String sellerUid;
  String productBrand;
  String productName;
  double productRating;
  int noOfReviews;
  String productPrice;
  List productOptions;
  List buyOptions = [];
  String productDescription;
  List productHighlights;
  List productSpecifications;
  List productReviews;
  List productQnas;
  List buyerNames = [];
  List buyerIds = [];
  String qtyToBuy = '1';
  List<String> totalQty = [];

  Future fetchProduct() async {
    var response;
    response = await http.get('$productApi/products/fetch/single/$productID');

    final res = jsonDecode(response.body);
    // print(res);
    productID = res['_id'];
    productUid = res['uid'];
    sellerUid = res['seller_id'];
    productBrand = res['brand'];
    productName = res['productName'];
    productRating = double.parse(res['rating'].toString());
    noOfReviews = res['ratingNo'];
    productPrice = res['price'].toString();
    productOptions = res['options'];
    populateBuyOptions(res['options']);
    productDescription = res['description'];
    productHighlights = res['highlights'];
    productSpecifications = res['specifications'];
    productReviews = res['reviews'];
    productImgs = res['imgs'];
    miniThumb = res['miniThumb'];
    // productQnas = res['qna'];
    // getQnames(res['qna']);
    populateQty(res['qty']);
    getQnas().then(
      (_) => getQnames().then(
        (_) {
          initialFetch = true;
          result = ViewProductLayout();
          notifyListeners();
        },
      ),
    );
  }

  Future getQnas() async {
    final response =
        await http.get('$productApi/qna/buyer/only_four?key=$productID');
    productQnas = jsonDecode(response.body);
    if (productQnas.length > 0) {
      for (var qna in productQnas) {
        if (!buyerIds.contains(qna['buyer_id'])) {
          buyerIds.add(qna['buyer_id']);
        }
      }
    }
  }

  Future getQnames() async {
    final response = await http.post(
      '$peopleApi/customers/get_name',
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({'uids': buyerIds}),
    );
    buyerNames = jsonDecode(response.body);
  }

  String getBuyerName(uid) {
    for (var names in buyerNames) {
      if (names['uid'] == uid) {
        return names['displayName'];
      }
    }
    return "No name";
  }

  void populateQty(int qty) {
    totalQty = [];
    for (var i = 1; i <= qty; i++) {
      totalQty.add(i.toString());
    }
  }

  void populateBuyOptions(List options) {
    for (var option in options) {
      final newOtpn = {'name': option['name'], 'value': option['default']};
      buyOptions.add(newOtpn);
    }
  }

  void changeOption(String name, String value) {
    for (var option in buyOptions) {
      if (option['name'] == name) {
        option['value'] = value;
      }
    }
    print(buyOptions);
  }

  void changeQty(String val) {
    qtyToBuy = val;
  }

  void addTocart() {
    // print('Add To cart');
    cart.add({
      'product_uid': productUid,
      'product_id': productID,
      'name': productName,
      'qty': qtyToBuy,
      'totalQty': totalQty,
      'miniThumb': miniThumb,
      'seller_uid': sellerUid,
      'options': buyOptions,
      'price': productPrice
    });
  }

  void refresh() {
    result = spinkit;
    notifyListeners();
    fetchProduct();
  }
}
