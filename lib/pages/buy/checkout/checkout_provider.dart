import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart';
import 'package:nepek_buyer/pages/buy/checkout/layout/checkout_layout.dart';
import 'package:nepek_buyer/savedData/apis.dart';
import 'package:nepek_buyer/savedData/httpUri.dart';
import 'package:nepek_buyer/styles/spinkit.dart';

class CheckoutProvider with ChangeNotifier {
  final Box userDeliveryAreas = Hive.box('userDeliveryAreas');

  var args;
  Widget body = logoLoader();
  bool initFetcch = false;
  int totalPrice = 0;
  int deliveryCharge;

  void initState() {
    final defaultDeliveryAddress =
        userDeliveryAreas.get('default_delivery_area');
    getDeliveryCharge(defaultDeliveryAddress['city_id']).then((_) {
      for (var item in args['products']) {
        totalPrice += item['price'] * item['qty'];
        if (args['products'].indexOf(item) == 0) {
          item['delivery_charge'] = deliveryCharge;
        }
      }
      totalPrice += deliveryCharge;
      body = CheckoutLayout();
      initFetcch = true;
      notifyListeners();
    });
  }

  Future getDeliveryCharge(String city) async {
    final res = await get(
      httpUri(serviceOne, 'delivery_address/delivery_charge?id=$city'),
    );
    deliveryCharge = jsonDecode(res.body)['delivery_charge'];
  }
}
