import 'package:flutter/material.dart';
import 'package:nepek_buyer/savedData/user_data.dart';
import 'package:nepek_buyer/styles/toasts/error_toast.dart';

class PaymentMethodProvider with ChangeNotifier {
  var args;

  void buyNow(BuildContext context) {
    print(args);
  }
}
