import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:nepek_buyer/library/account/signOut.dart';
import 'package:nepek_buyer/savedData/user_data.dart';
import 'package:nepek_buyer/styles/toasts/sucess_toast.dart';

class AccountState extends ChangeNotifier {
  final Box userAddress = Hive.box('userAddress');
  var args;
  bool initState = false;
  String displayName;

  List deliveryAddresses;
  Map defaultDeliveryAddress;

  void getUserData() {
    deliveryAddresses = userAddress.get('deliveryAreas') ?? [];
    defaultDeliveryAddress = userAddress.get('default_delivery_area') ?? {};
    displayName = UserPreferences().getDisplayName();
  }

  refreshAccount() {
    getUserData();
    args['checkProfile']();
    notifyListeners();
  }

  signOut(BuildContext context) {
    signOutUser();
    args['checkProfile']();
    sucessToast(context, 'Signed Out');
    Navigator.of(context).pop();
  }
}
