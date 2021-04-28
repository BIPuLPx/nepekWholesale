import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:nepek_buyer/functions/token_header.dart';
import 'package:nepek_buyer/pages/my/myOrders/viewOrder/main.dart';
import 'package:nepek_buyer/savedData/apis.dart';
import 'package:nepek_buyer/styles/spinkit.dart';

class ViewOrderProvider extends ChangeNotifier {
  String id;
  bool initFetch = false;
  Widget body = spinkit;
  Map orderData;

  Future getOrderData() async {
    // print(id);
    final response = await get(
      '$peopleApi/buy_system/buyer/single_order?key=$id',
      headers: tokenHeader(),
    );
    orderData = jsonDecode(response.body);
    if (orderData != null) {
      body = ViewOrderLayout();
      initFetch = true;
      notifyListeners();
    }
  }
}
