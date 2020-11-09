import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:nepek_buyer/savedData/apis.dart';
import 'package:nepek_buyer/savedData/user_data.dart';
import 'package:http/http.dart' as http;
import 'package:nepek_buyer/styles/popUps/loading_popup.dart';
import 'package:nepek_buyer/styles/toasts/error_toast.dart';
import 'package:nepek_buyer/styles/toasts/sucess_toast.dart';

class AccountState extends ChangeNotifier {
  var args;
  bool initState = false;
  String displayName;
  String phoneNumber;
  List deliveryAddresses;
  String defaultDeliveryAddress;

  void getUserData() {
    final deliveryAddBox = Hive.box('deliveryAddresses');
    defaultDeliveryAddress = deliveryAddBox.get('userDefault') ?? '';
    deliveryAddresses = deliveryAddBox.get('userAreas') ?? [];
    displayName = UserPreferences().getDisplayName();
    phoneNumber = UserPreferences().getphoneNumber();
    initState = true;
  }

  String getDefaultAddress() {
    for (var add in deliveryAddresses) {
      if (add['_id'] == defaultDeliveryAddress) {
        return add['label'];
      }
    }
    return '';
  }

  Future deleteDeliveryAddress(BuildContext context, val) async {
    loadingPopUP(context, 'Adding Address');
    var response = await http.put(
      '$peopleApi/customers/shippingaddress?type=remove',
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${UserPreferences().getJwtToken()}'
      },
      body: jsonEncode(val),
    );
    if (response.statusCode == 200) {
      final newDeliveryAddress = jsonDecode(response.body);
      Navigator.of(context).pop();
      final deliveryAddBox = Hive.box('deliveryAddresses');
      deliveryAddBox.put('userAreas', newDeliveryAddress['deliveryAreas']);
      deliveryAddBox.put(
          'userDefault', newDeliveryAddress['default_delivery_area']);
      sucessToast(context, "Deleted Address");
      refreshAccount();
    }
  }

  refreshAccount() {
    getUserData();
    notifyListeners();
  }

  Future changeDefaultDeliveryAddress(BuildContext context, String key) async {
    Navigator.of(context).pop();
    if (key == defaultDeliveryAddress) {
      showErrorToast(context, 'Already default');
    } else {
      loadingPopUP(context, 'Changing');
      final response = await http.put(
        '$peopleApi/customers/default_shipping_address?key=$key',
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${UserPreferences().getJwtToken()}'
        },
      );
      if (response.statusCode == 200) {
        final deliveryAddBox = Hive.box('deliveryAddresses');
        deliveryAddBox.put('userDefault', key);
        refreshAccount();
        sucessToast(context, 'Changed default address');
        Navigator.of(context).pop();
      }
    }
  }
}
