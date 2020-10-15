import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:skite_buyer/pages/searchResult/filter/main.dart';
import 'package:skite_buyer/savedData/apis.dart';
import 'package:http/http.dart' as http;

class FilterSearchState with ChangeNotifier {
  final _backend = BackEnd();

  var args;
  Map fetchedFilter;
  bool initialState = false;
  Map queryFilter;
  Map lastFiltered = {};
  int totalProducts;

  Future priceChanged(Map price) async {
    print(price);
// queryFilter["price"]["\$gte"]= price["min"]

// queryFilter
  }

  Future brandChanged(List brands, List lastValues) async {
    queryFilter['brand'] = brands;
    lastFiltered = {'name': 'brand', 'value': lastValues};
    await _backend
        .filterProductsWithSearch(queryFilter, args['searchText'])
        .then((value) {
      fetchedFilter = value['filtersOptions'];
      totalProducts = value['totalProductsNo'];

      notifyListeners();
    });
  }

  Future optionsChanged(List options,){
    
  }





}

class BackEnd {
  Future filterProductsWithSearch(Map query, String searchText) async {
    final response = await http.post(
      '$productApi/products/fetch/get?type=filter&searchTerm=$searchText',
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(query),
    );
    return jsonDecode(response.body);
  }
}

// http://127.0.0.1:8000
