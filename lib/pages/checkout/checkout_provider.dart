import 'package:flutter/material.dart';
import 'package:nepek_buyer/pages/checkout/layout/checkout_layout.dart';

class CheckoutProvider with ChangeNotifier {
  var args;
  Widget body = Container();
  bool initFetcch = false;
  int totalPrice = 0;

  void initState() {
    for (var item in args['products']) {
      totalPrice += int.parse(item['price']);
    }
    body = CheckoutLayout();
    initFetcch = true;
  }
}
