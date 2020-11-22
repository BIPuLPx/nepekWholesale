import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:nepek_buyer/savedData/user_data.dart';
import 'package:nepek_buyer/styles/toasts/error_toast.dart';

class OrderDetailsProvider with ChangeNotifier {
  var args;
  String defaultDeliveryAddress;
  Map deliveryAddress;
  String displayName;
  String phoneNumber;

  confirmOrder(BuildContext context) {
    if (defaultDeliveryAddress == '' || phoneNumber == '') {
      showErrorToast(
        context,
        defaultDeliveryAddress == ''
            ? 'Add delivery address before checkout'
            : 'Add phone Number before checkout',
      );
      Navigator.pushNamed(
        context,
        'account',
        arguments: {'checkProfile': () => refresh(), 'logout': true},
      );
    } else {
      Navigator.pushNamed(context, 'checkout', arguments: args);
    }
    // print(defaultDeliveryAddress);
    // print(phoneNumber);
    // print(args);
  }

  refresh() => notifyListeners();

  getDefaultAddress() => populateDeliveryAddress();

  void getDeliveryCharge(String districtID) {
    final deliveryAddBox = Hive.box('deliveryAddresses');
    final deliveryAreas = deliveryAddBox.get('location_group') ?? [];
    args['area_id'] = defaultDeliveryAddress;
    for (var area in deliveryAreas) {
      if (area['district_id'] == districtID) {
        args['delivery_charge'] = area['delivery_charge'];
      }
    }
  }

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
            getDeliveryCharge(district['_id']);
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
