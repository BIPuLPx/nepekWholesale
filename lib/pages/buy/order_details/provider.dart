import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:nepek_buyer/styles/toasts/error_toast.dart';

class OrderDetailsProvider with ChangeNotifier {
  final Box userDeliveryAreas = Hive.box('userDeliveryAreas');
  var args;
  Map defaultDeliveryAddress;

  confirmOrder(BuildContext context) {
    if (defaultDeliveryAddress.length == 0) {
      showErrorToast(context, 'Add delivery address before checkout');
      Navigator.pushNamed(
        context,
        'account',
        arguments: {'checkProfile': () => refresh(), 'hideLogout': true},
      );
    } else {
      Navigator.pushNamed(context, 'checkout', arguments: args);
    }
  }

  refresh() => notifyListeners();

  getDefaultAddress() => populateDeliveryAddress();

  void populateDeliveryAddress() {
    defaultDeliveryAddress =
        userDeliveryAreas.get('default_delivery_area') ?? {};
  }
}
