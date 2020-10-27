import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:skite_buyer/savedData/apis.dart';

class BackEnd {
  Future filterProductsWithSearch(
      String type, Map query, String searchText) async {
    String filterURL;
    if (type == 'search') {
      filterURL =
          '$productApi/products/fetch/get?type=filter&searchTerm=$searchText';
    } else {
      filterURL =
          '$productApi/products/fetch/get?type=filter&subcategory=$searchText';
    }
    final response = await http.post(
      filterURL,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(query),
    );
    return jsonDecode(response.body);
  }
}
