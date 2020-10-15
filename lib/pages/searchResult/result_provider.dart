import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:skite_buyer/pages/searchResult/screens/no_products_search.dart';
import 'package:skite_buyer/pages/searchResult/resultLayout/main.dart';
import 'package:skite_buyer/pages/searchResult/styles/end_of_result.dart';
import 'dart:convert';
import 'package:skite_buyer/savedData/apis.dart';
import 'package:skite_buyer/pages/searchResult/styles/loading_more.dart';
import 'package:skite_buyer/styles/spinkit.dart';

class ResultState with ChangeNotifier {
  final _backends = BackEnd();
  final _frontends = FrontEnd();
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
  Map fetchedFilter;

  Map queryFilter = {
    "price": {"\$gte": "", "\$lt": ""},
    "brand": [],
    "options": []
  };

  Future fetchInitialSearch() async {
    await _backends
        .searchProducts(searchText, sortBy['sort'], sortBy['by'], 1)
        .then((res) async {
      products = res['products'];
      productsNo = res['totalProductsNo'];
      fetchedFilter = res['filters'];
      await _frontends
          .checkFetchedProducts(res['products'].length, searchText)
          .then((screen) async {
        result = screen;
        await _frontends.checkNextPage(res['pages']).then((isNext) async {
          if (isNext) {
            isNextPage = true;
            nextPage = nextPage + 1;
          } else {
            isNextPage = false;
            loadingMore = EndOfResult();
          }
          initialFetch = true;
          notifyListeners();
        });
      });
    });
  }

  Future infiniteScroll(int page) async {
    _backends
        .searchProducts(searchText, sortBy['sort'], sortBy['by'], page)
        .then((res) async {
      if (res['products'].length > 0) {
        products.addAll(res['products']);
      }
      _frontends.checkNextPage(res['pages']).then((isNext) {
        if (isNext) {
          isNextPage = true;
          nextPage = nextPage + 1;
        } else {
          isNextPage = false;
          loadingMore = EndOfResult();
        }
        notifyListeners();
      });
    });
  }

  void refreshPageWithFilter(Map queryFilter) {
    queryFilter = queryFilter;
    result = spinkit;
    initialFetch = false;
    // bool isNextPage = true;
    nextPage = 0;
    loadingMore = loading_more;
    isbeingFiltered = false;
  }
}

class FrontEnd {
  Future checkFetchedProducts(int productsLength, String query) async {
    if (productsLength > 0) {
      return ResultLayout();
    } else {
      return NoProductsSearch(query: query);
    }
  }

  Future checkNextPage(Map pages) async {
    if (pages.isEmpty) {
      return false;
    } else if (pages['next'] == null) {
      return false;
    } else {
      return true;
    }
  }
}

class BackEnd {
  Future searchProducts(
      String searchText, String sortfor, String sortBy, int page) async {
    final response = await http.post(
        '$productApi/products/fetch/get?type=search&searchTerm=$searchText&page=${page.toString()}&limit=8&sort=$sortfor&by=${sortBy.toString()}');
    return jsonDecode(response.body);
  }
}
