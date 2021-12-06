import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:nepek_buyer/styles/text/end_of_result.dart';
import 'package:nepek_buyer/pages/products/result/styles/loading_more.dart';
import 'package:nepek_buyer/styles/spinkit.dart';
import 'backend.dart';
import 'frontend.dart';

class ResultState with ChangeNotifier {
  PopulateClassification _populateClassification = PopulateClassification();
  var args;
  final _backend = BackEnd();
  final _frontend = FrontEnd();
  bool initialFetch = false;
  dynamic result = LoaderWithAppBar();
  List products;
  int productsNo;
  String searchText;
  bool isNextPage;
  int nextPage = 1;
  Widget loadingMore = LoadingMore(value: 'Getting More Products');
  Widget loaded = EndOfResult(label: "All products loaded");
  Map sortBy = {'sort': 'clicks', 'by': '-1'};
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

//
  List classifiedList;
  String argsTo;
//

  void setSort(Map sort) {
    sortBy = sort;
    result = spinkit;
    notifyListeners();
    fetchInitialSearch();
  }
  // {"for": "categories", ..._class},

  Future fetchInitialSearch() async {
    await queryFromArgs(args);
    await _backend
        .searchProducts(
            args, sortBy['sort'], sortBy['by'], 1, toFilter, queryFilter)
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
          }
          initialFetch = true;
          notifyListeners();
        });
      });
    });
  }

  Future infiniteScroll(int page) async {
    _backend
        .searchProducts(
            args, sortBy['sort'], sortBy['by'], page, toFilter, queryFilter)
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
          loadingMore = loaded;
        }
        notifyListeners();
      });
    });
  }

  Future refreshPageWithFilter(Map queryFilter1, Map lastFiltered1) async {
    queryFilter = queryFilter1;
    lastFiltered = lastFiltered1;
    nextPage = 1;
    loadingMore = LoadingMore(value: 'Getting More Products');
    sortBy = {'sort': 'clicks', 'by': '-1'};
    await fetchInitialSearch();
  }

  Future resetPage() async {
    queryFilter = defaultQueryFilter;
    nextPage = 1;
    loadingMore = LoadingMore(value: 'Getting More Products');
    sortBy = {'sort': 'clicks', 'by': 'asc'};
    await fetchInitialSearch();
  }

  bool getSort(Map sortedBy) {
    bool isSorted =
        sortBy['sort'] == sortedBy['sort'] && sortBy['by'] == sortedBy['by'];
    return isSorted;
  }

  // getargsType(args) {
  //   final argsType = args['type'];
  //   if (argsType == 'categories') {
  //     return {'for': 'categories', 'qurey': args['_id']};
  //   }
// }

  queryFromArgs(args) {
    final argsFrom = args['from'];
    switch (argsFrom) {
      case 'class':
        classifiedList =
            _populateClassification.categories(args['query']['_id']);
        argsTo = 'subCategory';
        break;

      case 'category':
        classifiedList =
            _populateClassification.subcategories(args['query']['_id']);
        argsTo = '';
        break;

      default:
        classifiedList = [];
        argsTo = '';
        break;
    }
  }
}

class PopulateClassification {
  Box classifications = Hive.box('classifications');

  List categories(String classID) {
    final allCategories = classifications.get('categories');
    final categoriesFiltered =
        allCategories.where((classs) => classs['class_id'] == classID).toList();
    return categoriesFiltered;
  }

  List subcategories(categoryID) {
    final allSubCategories = classifications.get('subcategories');
    final categoriesFiltered = allSubCategories
        .where((subcategory) => subcategory['category_id'] == categoryID)
        .toList();
    return categoriesFiltered;
  }
}
