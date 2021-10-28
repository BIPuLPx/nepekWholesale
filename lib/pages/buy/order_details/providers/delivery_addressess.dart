import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:nepek_buyer/pages/my/address_book/functions/change_default_address.dart';

class AddressBookProvider with ChangeNotifier {
  Map defaultDeliveryAddress;
  List deliveryAddresses;
  final Box userDeliveryAreas = Hive.box('userDeliveryAreas');
  var refreshAccount;

  void init() {
    deliveryAddresses = userDeliveryAreas.get('deliveryAreas') ?? [];
    defaultDeliveryAddress = userDeliveryAreas.get('default_delivery_area') ?? {};
  }

  void refresh() {
    init();
    refreshAccount();
    notifyListeners();
  }

  changeDefault(context, body) => changeDefaultDeliveryAddress(context, body, refresh);
}
