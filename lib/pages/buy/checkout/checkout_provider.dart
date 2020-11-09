import 'package:flutter/material.dart';

import 'layout/checkout_layout.dart';

class CheckoutProvider with ChangeNotifier {
  var args;
  Widget body = Container();
  bool initFetcch = false;
  int totalPrice = 0;

  void initState() {
    for (var item in args['products']) {
      totalPrice += int.parse(item['price']);
    }
    totalPrice += args['delivery_charge'];
    body = CheckoutLayout();
    initFetcch = true;
  }
}
