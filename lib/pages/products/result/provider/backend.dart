import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nepek_buyer/savedData/apis.dart';
import 'package:nepek_buyer/savedData/httpUri.dart';

class BackEnd {
  Future searchProducts(var args, String sortfor, String sortBy, int page,
      bool toFilter, Map queryFilter) async {
    String queryURL;

    switch (args['from']) {
      case 'class':
        queryURL =
            'products/fetch/get?class=${args['query']['_id']}&page=${page.toString()}&limit=8&sort=$sortfor&by=${sortBy.toString()}';
        break;
      case 'category':
        queryURL =
            'products/fetch/get?category=${args['query']['_id']}&page=${page.toString()}&limit=8&sort=$sortfor&by=${sortBy.toString()}';
        break;
      case 'subCategory':
        queryURL =
            'products/fetch/get?subcategory=${args['query']['_id']}&page=${page.toString()}&limit=8&sort=$sortfor&by=${sortBy.toString()}';
        break;
      default:
    }

    // if (searchBy == 'search') {
    //   queryURL =
    //       'products/fetch/get?type=search&searchTerm=$searchText&page=${page.toString()}&limit=8&sort=$sortfor&by=${sortBy.toString()}';
    // } else {
    //   queryURL =
    //       'products/fetch/get?type=subcategory&subcategory=$searchText&page=${page.toString()}&limit=8&sort=$sortfor&by=${sortBy.toString()}';
    // }

    final response = await http.post(
      httpUri(serviceTwo, queryURL),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(queryFilter),
    );
    return jsonDecode(response.body);
  }
}
