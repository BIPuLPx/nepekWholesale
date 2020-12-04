import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nepek_buyer/pages/products/result/styles/end_of_result.dart';
import 'package:nepek_buyer/pages/products/result/styles/loading_more.dart';
import 'package:nepek_buyer/styles/spinkit.dart';

import 'backend.dart';
import 'frontend.dart';

class ResultState with ChangeNotifier {
  var args;
  final _backend = BackEnd();
  final _frontend = FrontEnd();
  bool initialFetch = false;
  dynamic result = spinkit;
  List products;
  int productsNo;
  String searchText;
  bool isNextPage;
  int nextPage = 1;
  dynamic loadingMore = loading_more;
  Map sortBy = {'sort': 'clicks', 'by': 'desc'};
  Map fetchedFilter;
  bool toFilter;
  Map lastFiltered = {};

  final Map defaultQueryFilter = {
    "price": {"\$gte": "", "\$lt": ""},
    "brand": [],
    "specifications": []
  };
  Map queryFilter = {
    "price": {"\$gte": "", "\$lt": ""},
    "brand": [],
    "specifications": []
  };

  void setSort(Map sort) {
    sortBy = sort;
    result = spinkit;
    notifyListeners();
    fetchInitialSearch();
  }

  Future fetchInitialSearch() async {
    await _backend
        .searchProducts(args['type'], args['query'], sortBy['sort'],
            sortBy['by'], 1, toFilter, queryFilter)
        .then((res) async {
      products = res['products'];
      productsNo = res['totalProductsNo'];
      fetchedFilter = res['filters'];
      await _frontend
          .checkFetchedProducts(res['products'].length, searchText)
          .then((screen) async {
        result = screen;
        await _frontend.checkNextPage(res['pages']).then((isNext) async {
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
    _backend
        .searchProducts(args['type'], args['query'], sortBy['sort'],
            sortBy['by'], page, toFilter, queryFilter)
        .then((res) async {
      if (res['products'].length > 0) {
        products.addAll(res['products']);
      }
      _frontend.checkNextPage(res['pages']).then((isNext) {
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

  Future refreshPageWithFilter(Map queryFilter1, Map lastFiltered1) async {
    // print(queryFilter);
    queryFilter = queryFilter1;
    lastFiltered = lastFiltered1;
    // bool isNextPage = true;
    nextPage = 1;
    loadingMore = loading_more;
    sortBy = {'sort': 'clicks', 'by': 'asc'};
    await fetchInitialSearch();
  }

  Future resetPage() async {
    queryFilter = defaultQueryFilter;
    nextPage = 1;
    loadingMore = loading_more;
    sortBy = {'sort': 'clicks', 'by': 'asc'};
    await fetchInitialSearch();
  }
}
