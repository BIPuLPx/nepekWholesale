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
  final Box userDeliveryAreas = Hive.box('userDeliveryAreas');
  var args;
  bool initState = false;
  String displayName;

  List deliveryAddresses;
  Map defaultDeliveryAddress;

  void getUserData() {
    deliveryAddresses = userDeliveryAreas.get('deliveryAreas') ?? [];
    defaultDeliveryAddress =
        userDeliveryAreas.get('default_delivery_area') ?? {};
    displayName = UserPreferences().getDisplayName();
    initState = true;
  }

  refreshAccount() {
    getUserData();
    notifyListeners();
  }

  signOut() {
    // final deliveryAddBox = Hive.box('deliveryAddresses');
    //         deliveryAddBox.put('userAreas', null);
    //         UserPreferences().displayName(null);
    //         UserPreferences().buyerKey(null);
    //         UserPreferences().jwtToken(null);
    //         UserPreferences().phoneNumber(null);
    //         UserPreferences().loggedIn(false);
    //         checkProfile();
    //         sucessToast(context, 'Signed Out');
    //         Navigator.of(context).pop();
  }
}
