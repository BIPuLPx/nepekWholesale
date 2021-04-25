import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:nepek_buyer/functions/token_header.dart';
import 'package:nepek_buyer/savedData/apis.dart';
import 'package:nepek_buyer/savedData/user_data.dart';

class InjectDatas {
  Box _customProductBox = Hive.box('customProducts');
  final Box userDeliveryAreas = Hive.box('userDeliveryAreas');

  Future<bool> testCustomProducts(String name) async {
    final key = _customProductBox.get('${name}key');
    if (key == null) {
      return false;
    } else {
      // print('here');
      final response = await http.get(
          '$productApi/custom_products/check_changed?type=$name',
          headers: {
            'Authorization': 'Bearer ${UserPreferences().getJwtToken()}'
          });
      final Map backendData = jsonDecode(response.body);
      // print(backendData);
      final backEndkey = backendData['change_id'];
      if (key == backEndkey) {
        return true;
      } else {
        return false;
      }
    }
  }

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
    _putFetchedDatainBox('changed');
    _putFetchedDatainBox('states');
    _putFetchedDatainBox('districts');
    _putFetchedDatainBox('cities');
    _putFetchedDatainBox('areas');
  }

  void _putFetchedDatainBox(String key) {
    final deliveryAddBox = Hive.box('deliveryAddresses');
    deliveryAddBox.put(key, fetchedData[key]);
  }

  Future getCustomProducts(String name) async {
    final response = await http
        .get('$productApi/custom_products/get_raw?type=$name', headers: {
      'Authorization': 'Bearer ${UserPreferences().getJwtToken()}'
    });
    if (response.statusCode == 200) {
      final fetchedData = jsonDecode(response.body);
      _customProductBox.put(name, fetchedData['products']);
      _customProductBox.put('${name}key', fetchedData['products']);
    }
    return response.statusCode;
  }

  Future<void> getMyDeliveryAddresses() async {
    if (UserPreferences().getLoggedIn() != null &&
        UserPreferences().getLoggedIn() != false) {
      final response = await http.get(
        '$peopleApi/customers/my_delivery_addresses',
        headers: tokenHeader(),
      );
      final resData = jsonDecode(response.body);

      userDeliveryAreas.put('deliveryAreas', resData['deliveryAreas']);
      if (resData['deliveryAreas'].length > 0)
        userDeliveryAreas.put(
            'default_delivery_area', resData['default_delivery_area']);
    }
  }
}
