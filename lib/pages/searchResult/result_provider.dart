import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:skite_buyer/pages/searchResult/screens/filter_again.dart';
import 'package:skite_buyer/pages/searchResult/screens/no_products_search.dart';
import 'package:skite_buyer/pages/searchResult/resultLayout/main.dart';
import 'package:skite_buyer/pages/searchResult/styles/end_of_result.dart';
import 'dart:convert';
import 'package:skite_buyer/savedData/apis.dart';
import 'package:skite_buyer/pages/searchResult/styles/loading_more.dart';
import 'package:skite_buyer/styles/spinkit.dart';

class ResultState with ChangeNotifier {
  bool initialFetch = false;
  dynamic result = spinkit;
  List products;
  int productsNo;
  String searchText;
  bool isNextPage;
  int nextPage = 1;
  dynamic loadingMore = loading_more;
  Map sortBy = {'sort': 'clicks', 'by': 'asc'};
  bool isbeingFiltered = false;

  List filteredOptions;

  Map filterBy = {
    "price": {"\$gte": '', "\$lt": ''},
    "brand": [],
    "options": []
  };

  Map filterOptions = {
    "brands": [],
    "options": [],
  };

  void populateFilteredOptions(options) {
    filteredOptions = [];

    // print(options);
    for (var option in options) {
      final letsAdd = {'name': option['name'], 'values': []};
      filteredOptions.add(letsAdd);
    }
  }

  Future fetchInitialSearch() async {
    var response;
    if (isbeingFiltered == false) {
      response = await http.post(
          '$productApi/products/fetch/search?term=$searchText&page=1&limit=8&sort=${sortBy['sort']}&by=${sortBy['by']}');
    } else {
      response = await http.post(
        '$productApi/products/fetch/search?term=$searchText&page=1&limit=8&sort=${sortBy['sort']}&by=${sortBy['by']}',
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(filterBy),
      );
      // print(jsonDecode(response.body));
    }

    final res = jsonDecode(response.body);

    if (res['results'].length > 0) {
      products = res['results'];
      result = ResultLayout();

      productsNo = res['resultNo'];
    } else {
      if (isbeingFiltered == false) {
        result = NoProductsSearch(query: searchText);
      } else {
        result = FilterAgain(
          args: {
            'args': {
              'filterBy': filterBy,
              'filterOptions': filterOptions,
              'filteredOptions': filteredOptions
            },
            'filterFn': setFilter,
          },
        );
      }
    }

    if (res['next'] == null) {
      // print('there is no next');
      isNextPage = false;
      loadingMore = EndOfResult();
    } else {
      // print('there is next');
      isNextPage = true;
      nextPage = nextPage + 1;
    }
    if (initialFetch == false) {
      filterOptions['brands'] = res['brands'];
      filterOptions['options'] = res['options'];
      populateFilteredOptions(res['options']);
    }
    initialFetch = true;

    notifyListeners();
  }

  Future fetchSearch(int page) async {
    if (isNextPage == true) {
      final response = await http.post(
          '$productApi/products/fetch/search?term=$searchText&page=$page&limit=8&sort=${sortBy['sort']}&by=${sortBy['by']}');

      final res = jsonDecode(response.body);

      if (res['results'].length > 0) {
        products.addAll(res['results']);
      }

      if (res['next'] == null) {
        // print('there is no next');
        isNextPage = false;
        // print(isNextPage);
      } else {
        // print('there is next');
        isNextPage = true;
        nextPage = nextPage + 1;
      }
    } else {
      loadingMore = EndOfResult();
    }

    notifyListeners();
  }

  void setSort(Map sort) {
    nextPage = 1;
    loadingMore = loading_more;
    sortBy = sort;
    result = spinkit;
    notifyListeners();
    fetchInitialSearch();
  }

  void setFilter(dynamic data) {
    if (data == 'reset') {
      // print('reset');
      filterBy = {
        "price": {"\$gte": '', "\$lt": ''},
        "brand": [],
        "options": []
      };
      initialFetch = false;
    } else {
      // print(data);
      List options = [];
      for (var optn in data['filteredOptions']) {
        options.addAll(optn['values']);
      }
      final filteredBy = data['filteredBy'];
      filterBy['price']['\$gte'] = filteredBy['price']['min'];
      filterBy['price']['\$lt'] = filteredBy['price']['max'];
      filterBy['brand'] = filteredBy['brand'];
      filterBy['options'] = options;
      filteredOptions = data['filteredOptions'];
      notifyListeners();
      // print(filterBy);
      isbeingFiltered = true;
    }
    nextPage = 1;
    loadingMore = loading_more;
    result = spinkit;
    notifyListeners();
    fetchInitialSearch();
    // print('result');
    // print(filteredOptions);
  }

  // void fetchSearch(query) {
  //   print(query);
  //   fetchedResult = true;
  //   result.add('product');
  //   // notifyListeners();
  // }
}
