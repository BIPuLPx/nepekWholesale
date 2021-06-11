import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:nepek_buyer/functions/token_header.dart';
import 'package:nepek_buyer/library/sync/delivery_addresses.dart';
import 'package:nepek_buyer/savedData/apis.dart';
import 'package:nepek_buyer/savedData/httpUri.dart';
import 'package:nepek_buyer/styles/popUps/errorPopUp.dart';
import 'package:nepek_buyer/styles/popUps/loading_popup.dart';
import 'package:http/http.dart' as http;
import 'package:nepek_buyer/styles/spinkit.dart';
import 'package:nepek_buyer/styles/toasts/sucess_toast.dart';
import 'input_delivery_address/main.dart';

class AddDeliveryAddressState extends ChangeNotifier {
  final Validator _validator = Validator();
  final SendData _send = SendData();
  final SyncDeliveryAddresses _syncAddresses = SyncDeliveryAddresses();
  var args;
  Widget body = logoLoader();
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
  Map input = {
    "address": "",
    "name": "",
    "phone": "",
    "home_office": "home",
  };

  void makeInitinjection() async {
    await _syncAddresses.start().then((_) {
      deliveryAddressbox = Hive.box('deliveryAddresses');
      _bringLocationsOnState();
    });
  }

  void _bringLocationsOnState() {
    deliveryStates = deliveryAddressbox.get('states');
    allDistricts = deliveryAddressbox.get('districts');
    allAreas = deliveryAddressbox.get('areas');
    allCities = deliveryAddressbox.get('cities');

    if (args['type'] == 'edit') {
      initEdit(args['value']);
    } else {
      final String state3 = deliveryStates
          .where((state) => state['label'] == 'State 3')
          .toList()[0]['_id'];
      injectState(state3);
    }
    body = InputDeliveryAddress();
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
      injectAreas(value['_id']);
    } else if (of == 'area') {
      currentArea = value;
    }
    notifyListeners();
  }

  void inputChanged(String name, String val) {
    input[name] = val;
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
    injectAreas(getCities[0]['_id']);
  }

  void injectAreas(String cityID) {
    // print(allAreas);
    final getAreas =
        allAreas.where((area) => area['city_id'] == cityID).toList();
    // print(getAreas);

    currentArea = getAreas[0];
    deliveryAreas = getAreas;
  }

  Future done(BuildContext context) async {
    if (validateAll(context) == true) {
      Map data = {
        "name": input['name'],
        "phone": int.parse(input['phone']),
        "home_office": input['home_office'],
        "state": currentState['label'],
        "district": currentDistrict['label'],
        "city": currentCity['label'],
        "city_id": currentCity['_id'],
        "area": currentArea['label'],
        "address": input['address']
      };

      if (args['type'] == 'new') {
        loadingPopUP(context, 'Adding address');
        final status = await _send.addDeliveryAddress(data);
        if (status == 200) {
          sucessToast(context, 'Added address');
          Navigator.pop(context);
          Navigator.pop(context);
          args['refresh']();
        }
      }
      if (args['type'] == 'edit') {
        loadingPopUP(context, 'Editing address');
        data = {...data, '_id': args['value']['_id']};
        final status = await _send.editDeliveryAddress(data);
        if (status == 200) {
          sucessToast(context, 'Edited address');
          Navigator.pop(context);
          Navigator.pop(context);
          args['refresh']();
        }
      }
    }
  }

  void initEdit(Map value) {
    currentState = deliveryStates
        .where((state) => state['label'] == value['state'])
        .toList()[0];

    injectDistricts(currentState['_id']);
    currentDistrict = allDistricts
        .where((district) => district['label'] == value['district'])
        .toList()[0];

    injectCities(currentDistrict['_id']);
    currentCity =
        allCities.where((city) => city['label'] == value['city']).toList()[0];

    injectAreas(currentCity['_id']);
    currentArea =
        allAreas.where((area) => area['label'] == value['area']).toList()[0];

    input['name'] = value['name'];
    input['address'] = value['address'];
    input['phone'] = value['phone'].toString();
    input['home_office'] = value['home_office'];
  }

  // Future finalizedLocation(BuildContext context) async {
  //   loadingPopUP(context, 'Adding Address');
  //   if (!isDuplicateAddress(context)) {
  //     var response = await http.put(
  //       '$serviceOne/customers/shippingaddress?type=add',
  //       headers: {
  //         'Content-Type': 'application/json; charset=UTF-8',
  //         'Authorization': 'Bearer ${UserPreferences().getJwtToken()}'
  //       },
  //       body: jsonEncode(currentArea),
  //     );
  //     if (response.statusCode == 200) {
  //       final newDeliveryAddress = jsonDecode(response.body);

  //       Navigator.of(context).pop();
  //       final deliveryAddBox = Hive.box('deliveryAddresses');
  //       deliveryAddBox.put('userAreas', newDeliveryAddress['deliveryAreas']);
  //       deliveryAddBox.put(
  //           'userDefault', newDeliveryAddress['default_delivery_area']);

  //       if (args != null) {
  //         args();
  //       }
  //       sucessToast(context, "Updated address");
  //       Navigator.of(context).pop();
  //     }
  //   }
  // }
  validateAll(BuildContext context) {
    final _validatePhone = _validator.validatePhoneNumber(input['phone']);
    final _validateName = _validator.validateName('Name', input['name']);
    final _validateAddress =
        _validator.validateName('Address', input['address']);
    if (_validatePhone != null)
      errorPopup(context, _validatePhone);
    else if (_validateName != null)
      errorPopup(context, _validateName);
    else if (_validateAddress != null)
      errorPopup(context, _validateAddress);
    else
      return true;
  }
}

class Validator {
  String validatePhoneNumber(String val) {
    if (val.isEmpty) {
      return 'Please provide phone number';
    } else if (RegExp(r'^[0-9]*$').hasMatch(val) == false) {
      return 'Please enter valid phone number';
    } else if (val.length != 10) {
      return 'Phone number should have length of 10';
    }
    return null;
  }

  String validateName(String of, String val) {
    if (val.isEmpty) {
      return "$of cannot be empty";
    }
    return null;
  }
}

class SendData {
  final Box userDeliveryAreas = Hive.box('userDeliveryAreas');

  Future<int> addDeliveryAddress(Map data) async {
    final res = await http.put(
      httpUri(serviceOne, 'customers/shippingaddress?type=add'),
      headers: tokenHeaderContentType(),
      body: jsonEncode(data),
    );

    final resData = jsonDecode(res.body);

    userDeliveryAreas.put('deliveryAreas', resData['deliveryAreas']);
    userDeliveryAreas.put(
        'default_delivery_area', resData['default_delivery_area']);

    return res.statusCode;
  }

  Future<int> editDeliveryAddress(Map data) async {
    final res = await http.put(
      httpUri(serviceOne, 'customers/edit_shipping_address'),
      headers: tokenHeaderContentType(),
      body: jsonEncode(data),
    );

    final resData = jsonDecode(res.body);

    userDeliveryAreas.put('deliveryAreas', resData['deliveryAreas']);
    userDeliveryAreas.put(
        'default_delivery_area', resData['default_delivery_area']);

    return res.statusCode;
  }
}
