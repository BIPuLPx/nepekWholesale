import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:skite_buyer/savedData/apis.dart';
import 'package:skite_buyer/savedData/user_data.dart';
import 'package:http/http.dart' as http;
import 'package:skite_buyer/styles/popUps/loading_popup.dart';
import 'package:skite_buyer/styles/toasts/sucess_toast.dart';

class AccountState extends ChangeNotifier {
  bool initState = false;
  String displayName;
  String phoneNumber;
  List deliveryAddresses;

  void getUserData() {
    final deliveryAddBox = Hive.box('deliveryAddresses');
    deliveryAddresses = deliveryAddBox.get('userAreas');
    displayName = UserPreferences().getDisplayName();
    phoneNumber = UserPreferences().getphoneNumber();
    initState = true;
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
      deliveryAddBox.put('userAreas', newDeliveryAddress);
      sucessToast(context, "Sucessfully updated your address");
      Navigator.of(context).pop();
    }
  }
}
