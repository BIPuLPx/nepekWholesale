import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:skite_buyer/pages/result/no_products_search.dart';
import 'package:skite_buyer/pages/result/result_layout.dart';
import 'dart:convert';

import 'package:skite_buyer/savedData/apis.dart';
import 'package:skite_buyer/styles/spinkit.dart';

class ResultState with ChangeNotifier {
  bool fetchedResult = false;
  dynamic result = spinkit;
  bool products = false;
  String searchText;

  Future fetchSearch(query) async {
    searchText = query;
    final response =
        await http.get('$productApi/products/fetch/search?term=$query');
    final res = jsonDecode(response.body);
    if (res is List) {
      result = ResultLayout(products: jsonDecode(response.body));
      products = true;
    } else if (res is Map) {
      result = NoProductsSearch(query: searchText);
    }
    fetchedResult = true;
    notifyListeners();
  }

  // void fetchSearch(query) {
  //   print(query);
  //   fetchedResult = true;
  //   result.add('product');
  //   // notifyListeners();
  // }
}
