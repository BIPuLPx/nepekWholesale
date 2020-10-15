import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:skite_buyer/savedData/apis.dart';

class InjectDatas {
  Future testClassification() async {
    final classifyBox = Hive.box('classifications');
    // print(classifyBox.get('bipul'));

    final key = classifyBox.get('categories_change');

    if (key == null) {
        return false;
    } else {
      final response = await http.get('$productApi/classification/get/check');
      final Map backendData = jsonDecode(response.body);
      final backEndkey = backendData['key'];
      if (key['key'] == backEndkey) {
        return true;
      }else{
        return false;
      }
    }
  }



  Future fetchClassification() async {
    final classifyBox = Hive.box('classifications');
    var response;
    response = await http.get('$productApi/classification/get/all');
    final Map backendData = jsonDecode(response.body);
    // print(backendData);
    classifyBox.put('categories_change', backendData['change']);
    classifyBox.put('classes', backendData['class']);
    classifyBox.put('categories', backendData['categories']);
    classifyBox.put('subcategories', backendData['subCategories']);
    // initFetch = true;
  }
}
