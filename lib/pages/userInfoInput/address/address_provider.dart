import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:nepek_buyer/savedData/apis.dart';
import 'package:nepek_buyer/savedData/user_data.dart';
import 'package:nepek_buyer/styles/popUps/loading_popup.dart';
import 'package:http/http.dart' as http;
import 'package:nepek_buyer/styles/toasts/error_toast.dart';
import 'package:nepek_buyer/styles/toasts/sucess_toast.dart';
import 'input_delivery_address/main.dart';

class AddDeliveryAddressState extends ChangeNotifier {
  var args;
  Widget body = Container();
  Box deliveryAddressbox = Hive.box('deliveryAddresses');
  bool initInjection = false;
  Map currentState;
  List deliveryStates;
  Map currentDistrict;
  List deliveryDistricts;
  Map currentArea;
  List deliveryAreas;
  Map fetchedData;
  List allDistricts;
  List allAreas;

  void makeInitinjection() {
    _bringLocationsOnState();
  }

  void _bringLocationsOnState() {
    deliveryStates = deliveryAddressbox.get('states');
    allDistricts = deliveryAddressbox.get('districts');
    allAreas = deliveryAddressbox.get('areas');
    // print(deliveryStates);
    // print(allDistricts);
    // print(allAreas);

    final String state3 = deliveryStates
        .where((state) => state['label'] == 'State 3')
        .toList()[0]['_id'];
    // print(state3);

    injectState(state3);
    body = InputDeliveryAddress();
    initInjection = true;
    // notifyListeners();
// print(deliveryAddressbox.get('location_group'));
  }

  void dropDownChanged(String of, Map value) {
    print(value);
    if (of == 'state') {
      currentState = value;
      injectDistricts(value['_id']);
    } else if (of == 'district') {
      currentDistrict = value;
      injectAreas(value['_id']);
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
    injectAreas(getDistricts[0]['_id']);
  }

  void injectAreas(String districtID) {
    print(allAreas);
    // print(districtID);
    final getAreas =
        allAreas.where((area) => area['district_id'] == districtID).toList();
    // print(getAreas);

    currentArea = getAreas[0];
    deliveryAreas = getAreas;
  }

  Future finalizedLocation(BuildContext context) async {
    loadingPopUP(context, 'Adding Address');
    if (!isDuplicateAddress(context)) {
      var response = await http.put(
        '$peopleApi/customers/shippingaddress?type=add',
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${UserPreferences().getJwtToken()}'
        },
        body: jsonEncode(currentArea),
      );
      if (response.statusCode == 200) {
        final newDeliveryAddress = jsonDecode(response.body);

        Navigator.of(context).pop();
        final deliveryAddBox = Hive.box('deliveryAddresses');
        deliveryAddBox.put('userAreas', newDeliveryAddress['deliveryAreas']);
        deliveryAddBox.put(
            'userDefault', newDeliveryAddress['default_delivery_area']);

        if (args != null) {
          args();
        }
        sucessToast(context, "Updated address");
        Navigator.of(context).pop();
      }
    }
  }

  bool isDuplicateAddress(BuildContext context) {
    final userAreas = deliveryAddressbox.get('userAreas');
    if (userAreas == null) {
      return false;
    } else {
      for (var area in userAreas) {
        if (area['_id'] == currentArea['_id']) {
          Navigator.of(context).pop();
          showErrorToast(context, 'Same address is already added');
          return true;
        }
      }
    }

    return false;
  }
}
