import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:nepek_buyer/savedData/apis.dart';
import 'package:nepek_buyer/savedData/user_data.dart';
import 'package:nepek_buyer/styles/spinkit.dart';

import 'my_orders_layout.dart';

class MyOrdersProvider with ChangeNotifier {
  bool initFetch = false;
  Widget body = spinkit;
  List allOrders;

  Future getOrders() async {
    final response = await get(
      '$peopleApi/buy_system/buyer/get_orders',
      headers: {"Authorization": "Bearer ${UserPreferences().getJwtToken()}"},
    );
    allOrders = jsonDecode(response.body);
    if (allOrders.length > 0) {
      body = MyOrdersLayout();
      initFetch = true;
    }
    notifyListeners();
  }
}
