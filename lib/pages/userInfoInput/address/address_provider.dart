import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import '../../../styles/spinkit.dart';
import 'input_delivery_address/main.dart';

class AddDeliveryAddressState extends ChangeNotifier {
  Widget body = spinkit;
  dynamic deliveryAddressbox = Hive.box('deliveryAddresses');
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

  // Future finalizedLocation(BuildContext context) async {
  //   saving(context);
  //   var response = await http.put(
  //     '$peopleApi/customers/shippingAddress',
  //     headers: {
  //       'Content-Type': 'application/json; charset=UTF-8',
  //       'Authorization': 'Bearer ${UserPreferences().getJwtToken()}'
  //     },
  //     body: jsonEncode({
  //       "province": currentState['label'],
  //       "district": currentDistrict['label'],
  //       "area": currentArea['label']
  //     }),
  //   );
  //   if (response.statusCode == 200) {
  //     Navigator.of(context).pop();
  //     UserPreferences().state(currentState['label']);
  //     UserPreferences().district(currentDistrict['label']);
  //     UserPreferences().area(currentArea['label']);
  //     Navigator.of(context).pop();
  //   }
  // }
}
