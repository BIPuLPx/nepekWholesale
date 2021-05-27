import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:nepek_buyer/savedData/apis.dart';
import 'package:nepek_buyer/savedData/httpUri.dart';
import 'package:http/http.dart' as http;

class SyncClassification {
  sync() async {
    await _testClassification().then((changed) async {
      if (!changed) await _fetchClassification();
    });
  }

  Future _testClassification() async {
    final classifyBox = Hive.box('classifications');
    final key = classifyBox.get('categories_change');

    if (key == null) {
      return false;
    } else {
      final response = await http.get(httpUri(
        productApi,
        'classification/get/check',
      ));
      final Map backendData = jsonDecode(response.body);
      final backEndkey = backendData['key'];
      if (key['key'] == backEndkey) {
        return true;
      } else {
        return false;
      }
    }
  }

  Future _fetchClassification() async {
    final classifyBox = Hive.box('classifications');
    var response;
    response = await http.get(httpUri(productApi, 'classification/get/all'));
    final Map backendData = jsonDecode(response.body);
    classifyBox.put('categories_change', backendData['change']);
    classifyBox.put('classes', backendData['class']);
    classifyBox.put('categories', backendData['categories']);
    classifyBox.put('subcategories', backendData['subCategories']);
  }
}
