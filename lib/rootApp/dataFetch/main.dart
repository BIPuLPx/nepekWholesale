import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:skite_buyer/savedData/apis.dart';

class InjectDatas {
  Future testDeliveryAddress() async {
    final deliveryAddBox = Hive.box('deliveryAddresses');
    final key = deliveryAddBox.get('delivery_change');

    if (key == null) {
      return false;
    } else {
      final response =
          await http.get('$peopleApi/changes/get?of=delivery_address');
      final Map backendData = jsonDecode(response.body);
      final backEndkey = backendData['new_id'];
      if (key['key'] == backEndkey) {
        return true;
      } else {
        return false;
      }
    }
  }

  Future testClassification() async {
    final classifyBox = Hive.box('classifications');
    final key = classifyBox.get('categories_change');

    if (key == null) {
      return false;
    } else {
      final response = await http.get('$productApi/classification/get/check');
      final Map backendData = jsonDecode(response.body);
      final backEndkey = backendData['key'];
      if (key['key'] == backEndkey) {
        return true;
      } else {
        return false;
      }
    }
  }

  Future fetchClassification() async {
    final classifyBox = Hive.box('classifications');
    var response;
    response = await http.get('$productApi/classification/get/all');
    final Map backendData = jsonDecode(response.body);
    classifyBox.put('categories_change', backendData['change']);
    classifyBox.put('classes', backendData['class']);
    classifyBox.put('categories', backendData['categories']);
    classifyBox.put('subcategories', backendData['subCategories']);
  }

  var fetchedData;
  Future fetchDeliveryAddress() async {
    var response;
    response = await http.get('$peopleApi/delivery_address/get_all');
    fetchedData = jsonDecode(response.body);
    // deliveryAddressbox.put('changed', null);
    _putFetchedDatainBox('changed');
    _putFetchedDatainBox('states');
    _putFetchedDatainBox('districts');
    _putFetchedDatainBox('location_group');
    _putFetchedDatainBox('areas');
  }

  void _putFetchedDatainBox(String key) {
    final deliveryAddBox = Hive.box('deliveryAddresses');
    deliveryAddBox.put(key, fetchedData[key]);
  }
}
