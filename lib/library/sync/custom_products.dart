import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:http/http.dart';
import 'package:nepek_buyer/savedData/apis.dart';
import 'package:nepek_buyer/savedData/httpUri.dart';
import 'package:nepek_buyer/savedData/user_data.dart';
import 'package:http/http.dart' as http;

class SyncCustomProducts {
  Box _customProductBox = Hive.box('customProducts');

  Future syncWishListsWithBackend() async {
    final bool isUptoDate = await testCustomProducts('wishlist');
    if (!isUptoDate) {
      return await getCustomProducts('wishlist');
    }
  }

  Future<bool> testCustomProducts(String name) async {
    final key = _customProductBox.get('${name}key');
    if (key == null) {
      return false;
    } else {
      // print('here');
      final response = await http.get(
          httpUri(serviceTwo, 'custom_products/check_changed?type=$name'),
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

  Future crdlCustomProducts(String productID, String crdl) async {
    final response = await put(
        httpUri(
            serviceTwo, 'custom_products/$crdl?type=wishlist&key=$productID'),
        headers: {
          'Authorization': 'Bearer ${UserPreferences().getJwtToken()}'
        });
    if (response.statusCode == 200) {
      return await syncWishListsWithBackend();
    }
  }

  Future getCustomProducts(String name) async {
    final response = await http.get(
        httpUri(serviceTwo, 'custom_products/get_raw?type=$name'),
        headers: {
          'Authorization': 'Bearer ${UserPreferences().getJwtToken()}'
        });
    if (response.statusCode == 200) {
      final fetchedData = jsonDecode(response.body);
      _customProductBox.put(name, fetchedData['products']);
      _customProductBox.put('${name}key', fetchedData['products']);
    }
    return response.statusCode;
  }
}
