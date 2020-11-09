import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nepek_buyer/savedData/apis.dart';

class BackEnd {
  Future searchProducts(String searchBy, String searchText, String sortfor,
      String sortBy, int page, bool toFilter, Map queryFilter) async {
    String searchURL;
    print(searchBy);
    if (searchBy == 'search') {
      searchURL =
          '$productApi/products/fetch/get?type=search&searchTerm=$searchText&page=${page.toString()}&limit=8&sort=$sortfor&by=${sortBy.toString()}';
    } else {
      searchURL =
          '$productApi/products/fetch/get?type=subcategory&subcategory=$searchText&page=${page.toString()}&limit=8&sort=$sortfor&by=${sortBy.toString()}';
    }

    final response = await http.post(
      searchURL,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(queryFilter),
    );
    return jsonDecode(response.body);
  }
}