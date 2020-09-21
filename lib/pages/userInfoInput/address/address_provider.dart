import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:skite_buyer/pages/userInfoInput/address/data/areas.dart';
import 'package:skite_buyer/pages/userInfoInput/address/data/districts.dart';
import 'package:skite_buyer/pages/userInfoInput/address/data/states.dart';
import 'package:skite_buyer/pages/userInfoInput/address/dialogs/saving.dart';
import 'package:http/http.dart' as http;
import 'package:skite_buyer/savedData/apis.dart';
import 'package:skite_buyer/savedData/user_data.dart';

class AddDeliveryAddressState extends ChangeNotifier {
  bool initInjection = false;
  Map currentState = {'value': '3', 'label': 'State 3'};
  List deliveryStates = states;
  Map currentDistrict;
  List deliveryDistricts;
  Map currentArea;
  List deliveryAreas;

  void makeInitinjection() {
    injectDistricts('3');
    initInjection = true;
  }

  void dropDownChanged(String of, Map val) {
    if (of == 'state') {
      injectState(val);
    } else if (of == 'district') {
      currentDistrict = val;
      injectAreas(val['value']);
    } else if (of == 'area') {
      currentArea = val;
    }
    notifyListeners();
  }

  void injectState(Map state) {
    currentState = state;
    injectDistricts(state['value']);
  }

  void injectDistricts(String state) {
    final getDistricts =
        districts.where((district) => district['state'] == state).toList();
    currentDistrict = getDistricts[0];
    deliveryDistricts = getDistricts;
    injectAreas(getDistricts[0]['value']);
  }

  void injectAreas(String district) {
    final getAreas =
        areas.where((area) => area['district'] == district).toList();
    currentArea = getAreas[0];
    deliveryAreas = getAreas;
  }

  Future finalizedLocation(BuildContext context) async {
    saving(context);
    var response = await http.put(
      '$peopleApi/customers/shippingAddress',
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${UserPreferences().getJwtToken()}'
      },
      body: jsonEncode({
        "province": currentState['label'],
        "district": currentDistrict['label'],
        "area": currentArea['label']
      }),
    );
    if (response.statusCode == 200) {
      Navigator.of(context).pop();
      UserPreferences().state(currentState['label']);
      UserPreferences().district(currentDistrict['label']);
      UserPreferences().area(currentArea['label']);
      Navigator.of(context).pop();
    }
  }
}
