import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:nepek_buyer/library/sync/delivery_addresses.dart';
import 'package:nepek_buyer/savedData/apis.dart';
import 'package:nepek_buyer/savedData/httpUri.dart';
import 'package:nepek_buyer/styles/popUps/errorPopUp.dart';
import 'package:nepek_buyer/styles/popUps/loading_popup.dart';
import 'package:nepek_buyer/styles/popUps/sucessPopup.dart';
import 'package:nepek_buyer/styles/spinkit.dart';

import 'main.dart';
import 'validators.dart';

class SignUpWithEmailProvider with ChangeNotifier {
  Widget body = logoLoader();

  final SyncDeliveryAddresses _syncAddresses = SyncDeliveryAddresses();

  final _validators = Validators();
  final formKey = GlobalKey<FormState>();
  bool autovalidate = false;
  String name;
  String email;
  String password;
  String rePassword;
  //
  Box deliveryAddressbox;
  bool initInjection = false;
  List deliveryStates;
  List deliveryDistricts;
  List deliveryCities;
  List deliveryAreas;
  Map fetchedData;
  List allDistricts;
  List allCities;
  List allAreas;
  Map currentState;
  Map currentDistrict;
  Map currentCity;
  Map currentArea;

  void makeInitinjection() {
    _syncAddresses.start().then((_) {
      deliveryAddressbox = Hive.box('deliveryAddresses');
      _bringLocationsOnState();
    });
  }

  void _bringLocationsOnState() {
    deliveryStates = deliveryAddressbox.get('states');
    allDistricts = deliveryAddressbox.get('districts');
    allAreas = deliveryAddressbox.get('areas');
    allCities = deliveryAddressbox.get('cities');

    final String state3 = deliveryStates
        .where((state) => state['label'] == 'State 3')
        .toList()[0]['_id'];
    injectState(state3);

    body = SignUpWithEmailLayout();
    initInjection = true;
    notifyListeners();
  }

  void dropDownChanged(String of, Map value) {
    if (of == 'state') {
      currentState = value;
      injectDistricts(value['_id']);
    } else if (of == 'district') {
      currentDistrict = value;
      injectCities(value['_id']);
    } else if (of == 'region') {
      currentCity = value;
      // injectAreas(value['_id']);
    } else if (of == 'area') {
      currentArea = value;
    }
    notifyListeners();
  }

  void injectState(String _id) {
    currentState =
        deliveryStates.where((state) => state['_id'] == _id).toList()[0];
    injectDistricts(_id);
  }

  void injectDistricts(String stateId) {
    final getDistricts = allDistricts
        .where((district) => district['state_id'] == stateId)
        .toList();
    currentDistrict = getDistricts[0];
    deliveryDistricts = getDistricts;
    injectCities(getDistricts[0]['_id']);
  }

  void injectCities(String districtID) {
    final getCities = allCities
        .where((deliveryArea) => deliveryArea['district_id'] == districtID)
        .toList();
    currentCity = getCities[0];
    deliveryCities = getCities;
    // injectAreas(getCities[0]['_id']);
  }

  // void injectAreas(String cityID) {
  //   // print(allAreas);
  //   final getAreas =
  //       allAreas.where((area) => area['city_id'] == cityID).toList();
  //   // print(getAreas);

  //   // currentArea = getAreas[0];
  //   // deliveryAreas = getAreas;
  // }

  void signUp(BuildContext context) {
    if (formKey.currentState.validate()) {
      signUpBackend(context);
    } else {
      autovalidate = true;
    }
    notifyListeners();
  }

  Future signUpBackend(BuildContext context) async {
    loadingPopUP(context, 'Creating Account');
    final address = {
      "state": currentState['label'],
      "district": currentDistrict['label'],
      "city": currentCity['label'],
      "city_id": currentCity['_id'],
    };
    final data = {
      "displayName": name,
      "email": email,
      "password": password,
      "address": address,
    };

    final response = await http.post(
      httpUri(serviceOne, 'customers/signup'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      Navigator.of(context).pop();
      Navigator.of(context).pop();
      sucessFulPopup(context, "Account created sucessfully");
    } else if (response.statusCode == 203) {
      Navigator.of(context).pop();
      errorPopup(context, "Email already exists,\nEnter a new one");
    }
  }

  void valChanged(String type, String val) {
    if (type == "name") {
      name = val;
    } else if (type == "email") {
      email = val;
    } else if (type == 'password1') {
      password = val;
    } else if (type == 'password2') {
      rePassword = val;
    }
  }

  String validateName(val) => _validators.validateName(val);
  String validateEmail(val) => _validators.validateEmail(val);
  String validatePassword(val) =>
      _validators.validatePassword(val, password, rePassword);
}
