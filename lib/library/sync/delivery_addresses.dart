import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:nepek_buyer/functions/token_header.dart';
import 'package:nepek_buyer/savedData/apis.dart';
import 'package:nepek_buyer/savedData/httpUri.dart';
import 'package:nepek_buyer/savedData/user_data.dart';
import 'package:http/http.dart' as http;

class SyncDeliveryAddresses {
  Box _userDeliveryAreas = Hive.box('userDeliveryAreas');

  start() async {
    await _testDeliveryAddress().then(
      (value) async {
        if (!value) await _fetchDeliveryAddress();
      },
    );
  }

  Future<void> getMyDeliveryAddresses() async {
    if (UserPreferences().getLoggedIn() != null &&
        UserPreferences().getLoggedIn() != false) {
      final response = await http.get(
        httpUri(serviceOne, 'customers/my_delivery_addresses'),
        headers: tokenHeader(),
      );
      final resData = jsonDecode(response.body);

      if (resData != null) {
        _userDeliveryAreas.put('deliveryAreas', resData['deliveryAreas']);
        if (resData['deliveryAreas'].length > 0)
          _userDeliveryAreas.put(
              'default_delivery_area', resData['default_delivery_area']);
      }
    }
  }

  Future _fetchDeliveryAddress() async {
    var fetchedData;
    var response;
    response = await http.get(
      httpUri(serviceOne, 'delivery_address/get_all'),
    );
    fetchedData = jsonDecode(response.body);

    void _putFetchedDatainBox(String key) {
      final deliveryAddBox = Hive.box('deliveryAddresses');
      deliveryAddBox.put(key, fetchedData[key]);
    }

    _putFetchedDatainBox('changed');
    _putFetchedDatainBox('states');
    _putFetchedDatainBox('districts');
    _putFetchedDatainBox('cities');
    _putFetchedDatainBox('areas');
  }

  Future _testDeliveryAddress() async {
    final deliveryAddBox = Hive.box('deliveryAddresses');
    final key = deliveryAddBox.get('changed');
    if (key == null) {
      return false;
    } else {
      final response = await http.get(
        httpUri(serviceOne, 'changes/get?of=delivery_address'),
      );
      final Map backendData = jsonDecode(response.body);
      final backEndkey = backendData['new_id'];
      if (key['new_id'] == backEndkey) {
        return true;
      } else {
        return false;
      }
    }
  }
}
