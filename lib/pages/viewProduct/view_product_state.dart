import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:skite_buyer/pages/viewProduct/view_product_layout.dart';
import 'dart:convert';
import 'package:skite_buyer/savedData/apis.dart';

import 'package:skite_buyer/styles/spinkit.dart';

class ViewProductState with ChangeNotifier {
  String productID;
  bool initialFetch = false;
  dynamic result = spinkit;
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
  List productQNames;
  String qtyToBuy = '1';
  List<String> totalQty = [];

  Future fetchProduct() async {
    var response;
    response = await http.get('$productApi/products/fetch/single/$productID');

    final res = jsonDecode(response.body);
    // print(res);
    productBrand = res['brand'];
    productName = res['productName'];
    productRating = res['rating'];
    noOfReviews = res['ratingNo'];
    productPrice = res['price'].toString();
    productOptions = res['options'];
    populateBuyOptions(res['options']);
    productDescription = res['description'];
    productHighlights = res['highlights'];
    productSpecifications = res['specifications'];
    productReviews = res['reviews'];
    productQnas = res['qna'];
    getQnames(res['qna']);
    populateQty(res['qty']);
    initialFetch = true;
    result = ViewProductLayout();

    notifyListeners();
  }

  Future getQnames(List qnas) async {
    List quids = [];
    for (var qna in qnas) {
      if (!quids.contains(qna['customer_uid'])) {
        quids.add(qna['customer_uid']);
      }
    }
    final response = await http.post(
      '$peopleApi/customers/get_name',
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({'uids': quids}),
    );
    productQNames = jsonDecode(response.body);
  }

  getQnamesLocal(uid) {
    for (var names in productQNames) {
      if (names['uid'] == uid) {
        return names['displayName'];
      }
    }
  }

  void populateQty(int qty) {
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
}
