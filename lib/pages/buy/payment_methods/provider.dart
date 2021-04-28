import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:nepek_buyer/functions/token_header.dart';
import 'package:nepek_buyer/savedData/apis.dart';
import 'package:nepek_buyer/savedData/user_data.dart';
import 'package:nepek_buyer/styles/popUps/errorPopUp.dart';
import 'package:nepek_buyer/styles/popUps/loading_popup.dart';
import 'package:nepek_buyer/styles/popUps/sucessPopup.dart';
import 'package:nepek_buyer/styles/toasts/error_toast.dart';

class PaymentMethodProvider with ChangeNotifier {
  List products;
  var refreshCart;

  void buyNow(BuildContext context) {
    final Box userDeliveryAreas = Hive.box('userDeliveryAreas');

    final defaultDeliveryAddress =
        userDeliveryAreas.get('default_delivery_area') ?? {};

    for (Map product in products) {
      product.remove('name');
      if (product['variant'] == null || product['variant'].length == 0)
        product.remove('variant');
    }

//  cityID, deliveryName, deliveryAddress, deliveryPhone, home_office, payment_method

    Map data = {
      'cityID': defaultDeliveryAddress['city_id'],
      'deliveryName': defaultDeliveryAddress['name'],
      'deliveryAddress': defaultDeliveryAddress['address'],
      'deliveryPhone': defaultDeliveryAddress['phone'],
      'home_office': defaultDeliveryAddress['home_office'],
      'payment_method': 0,
      'products': products
    };
    orderCart(context, data);
  }

  Future orderCart(BuildContext context, buySysData) async {
    loadingPopUP(context, 'Ordering');

    final response = await http.post(
      '$peopleApi/buy_system/buyer/buy',
      headers: tokenHeaderContentType(),
      body: jsonEncode(buySysData),
    );

    removeCartItems();

    Navigator.popUntil(context, ModalRoute.withName('home'));
    refreshCart();
    if (response.statusCode == 200)
      sucessFulPopup(context, 'All products were ordered');
    else
      showErrorToast(context, 'There was error reach us for details');
  }

  removeCartItems() {
    final cart = Hive.box('cart');
    cart.clear();
  }
}
