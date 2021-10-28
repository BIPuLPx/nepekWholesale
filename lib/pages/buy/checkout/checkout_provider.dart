import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart';
import 'package:nepek_buyer/pages/buy/checkout/layout/checkout_layout.dart';
import 'package:nepek_buyer/savedData/apis.dart';
import 'package:nepek_buyer/savedData/httpUri.dart';
import 'package:nepek_buyer/styles/spinkit.dart';
import 'package:nepek_buyer/styles/toasts/sucess_toast.dart';

class CheckoutProvider with ChangeNotifier {
  final Box userDeliveryAreas = Hive.box('userDeliveryAreas');

  var args;
  Widget body = logoLoader();
  bool initFetcch = false;
  int totalPrice = 0;
  int nepekDeliveryCharge;
  int deliveryCharge = 0;
  bool isFreeScheme = false;
  bool isFreeSchemeSelected = false;

  void initState() {
    final defaultDeliveryAddress = userDeliveryAreas.get('default_delivery_area');

    getnepekDeliveryCharge(defaultDeliveryAddress['city_id']).then((_) {
      body = CheckoutLayout();
      initFetcch = true;
      notifyListeners();
    });
  }

  Future getnepekDeliveryCharge(String city) async {
    final res = await get(
      httpUri(serviceOne, 'delivery_address/delivery_charge?id=$city'),
    );
    final resData = jsonDecode(res.body);
    nepekDeliveryCharge = resData['delivery_charge'];
    isFreeScheme = resData['isFreeScheme'];
    if (isFreeScheme) changeDeliveryCharge(0);
  }

  changeFreeDelivery(BuildContext context) {
    if (isFreeScheme) {
      if (!isFreeSchemeSelected) {
        changeDeliveryCharge(nepekDeliveryCharge);
        sucessToast(context, 'Changed to Quick Delivery');
      } else {
        changeDeliveryCharge(0);
        sucessToast(context, 'Changed to Standard Delivery');
      }
      isFreeSchemeSelected = !isFreeSchemeSelected;
    }
    notifyListeners();
  }

  changeDeliveryCharge(int deliveryCharge) {
    totalPrice = 0;
    for (var item in args['products']) {
      totalPrice += item['price'] * item['qty'];
      if (args['products'].indexOf(item) == 0) {
        if (deliveryCharge != 0)
          item['delivery_charge'] = nepekDeliveryCharge;
        else if (deliveryCharge == 0) item.remove('delivery_charge');
      }
    }
    totalPrice += deliveryCharge;
    deliveryCharge = deliveryCharge;
  }

  String getCurrentDeliveryMethod() {
    if (!isFreeSchemeSelected) return 'Standard Delivery';
    return 'Quick Delivery';
  }
}
