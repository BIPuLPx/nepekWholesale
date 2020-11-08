import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:nepek_buyer/savedData/user_data.dart';

class OrderDetailsProvider with ChangeNotifier {
  var args;
  String defaultDeliveryAddress;
  Map deliveryAddress;
  String displayName;
  String phoneNumber;

  confirmOrder(BuildContext context) {
    Navigator.pushNamed(context, 'checkout', arguments: args);
    // print(defaultDeliveryAddress);
    // print(phoneNumber);
    // print(args);
  }

  refresh() => notifyListeners();

  getDefaultAddress() => populateDeliveryAddress();

  void populateDeliveryAddress() {
    final deliveryAddBox = Hive.box('deliveryAddresses');
    defaultDeliveryAddress = deliveryAddBox.get('userDefault') ?? '';
    var deliveryAddresses = deliveryAddBox.get('userAreas') ?? [];
    displayName = UserPreferences().getDisplayName() ?? '';
    phoneNumber = UserPreferences().getphoneNumber() ?? '';
    var deliveryData = {"state": "", "district": "", "area": ""};
    var allStates = deliveryAddBox.get('states');
    var allDistricts = deliveryAddBox.get('districts');
    var allAreas = deliveryAddBox.get('areas');

    for (var add in deliveryAddresses) {
      if (add['_id'] == defaultDeliveryAddress) {
        deliveryData['area'] = add['label'];
      }
    }

    for (var area in allAreas) {
      if (area['_id'] == defaultDeliveryAddress) {
        for (var district in allDistricts) {
          if (district['_id'] == area['district_id']) {
            deliveryData['district'] = district['label'];
            for (var state in allStates) {
              if (state['_id'] == district['state_id']) {
                deliveryData['state'] = state['label'];
              }
            }
          }
        }
      }
    }
    deliveryAddress = deliveryData;
  }
}
