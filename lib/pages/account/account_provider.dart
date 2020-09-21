import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:skite_buyer/savedData/user_data.dart';

class AccountState extends ChangeNotifier {
  bool initState = false;
  String displayName;
  String phoneNumber;
  String state;
  String district;
  String area;

  void getUserData() {
    displayName = UserPreferences().getDisplayName();
    phoneNumber = UserPreferences().getphoneNumber();
    state = UserPreferences().getState();
    district = UserPreferences().getDistrict();
    area = UserPreferences().getarea();
    initState = true;
  }
}
