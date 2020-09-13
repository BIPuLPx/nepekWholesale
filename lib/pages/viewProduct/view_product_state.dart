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
  String productPrice;

  Future fetchProduct() async {
    var response;
    response = await http.get('$productApi/products/fetch/single/$productID');

    final res = jsonDecode(response.body);
    // print(res);
    productBrand = res['brand'];
    productName = res['productName'];
    productPrice = res['price'].toString();
    initialFetch = true;
    result = ViewProductLayout();

    notifyListeners();
  }
}
