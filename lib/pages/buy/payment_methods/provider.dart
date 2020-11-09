import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:nepek_buyer/savedData/apis.dart';
import 'package:nepek_buyer/savedData/user_data.dart';
import 'package:nepek_buyer/styles/popUps/loading_popup.dart';
import 'package:nepek_buyer/styles/popUps/sucessPopup.dart';

class PaymentMethodProvider with ChangeNotifier {
  var args;

  void buyNow(BuildContext context) {
    Map buySysData = {
      "products": [],
      "delivery_charge": 0,
      "area_id": "",
      "total": 0
    };
    final argss = args['args'];
    buySysData['products'] = argss['products'];
    buySysData['delivery_charge'] = argss['delivery_charge'];
    buySysData['area_id'] = argss['area_id'];
    buySysData['total'] = args['total'];

    // print(args);

    orderCart(context, buySysData);
  }

  Future orderCart(BuildContext context, Map buySysData) async {
    loadingPopUP(context, 'Ordering');
    final response = await http.post(
      '$peopleApi/buy_system/buyer/buy',
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${UserPreferences().getJwtToken()}'
      },
      body: jsonEncode(buySysData),
    );

    if (response.statusCode == 200) {
      removeCartItems();
      Navigator.of(context).pop();
      Navigator.of(context).pop();
      Navigator.of(context).pop();
      Navigator.of(context).pop();
      sucessFulPopup(context, 'All products were ordered');
    }
  }

  removeCartItems() {
    final cart = Hive.box('cart');
    cart.clear();
    args['args']['refresh']();
  }
}
