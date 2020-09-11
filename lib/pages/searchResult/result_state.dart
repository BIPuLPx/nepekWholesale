import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:skite_buyer/pages/searchResult/no_products_search.dart';
import 'package:skite_buyer/pages/searchResult/result_layout.dart';
import 'dart:convert';
import 'package:skite_buyer/savedData/apis.dart';
import 'package:skite_buyer/styles/loading_more.dart';
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

  Map filterBy = {
    "price": {"\$gte": 0, "\$lt": 0},
    "brand": [],
    "options": []
  };

  Map filterOptions = {
    "brands": [],
    "options": {},
  };

  Widget endOfSearch = Container(
    padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
    child: Text(
      'End of Result',
      style: GoogleFonts.abel(fontSize: 17),
    ),
  );

  Future fetchInitialSearch() async {
    final response = await http.post(
        '$productApi/products/fetch/search?term=$searchText&page=1&limit=8&sort=${sortBy['sort']}&by=${sortBy['by']}');

    final res = jsonDecode(response.body);

    if (res['results'].length > 0) {
      products = res['results'];
      result = ResultLayout();

      productsNo = res['resultNo'];
    } else {
      result = NoProductsSearch(query: searchText);
    }

    if (res['next'] == null) {
      // print('there is no next');
      isNextPage = false;
      loadingMore = endOfSearch;
    } else {
      // print('there is next');
      isNextPage = true;
      nextPage = nextPage + 1;
    }
    if (initialFetch == false) {
      filterOptions['brands'] = res['brands'];
      filterOptions['options'] = res['options'];
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
      loadingMore = endOfSearch;
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

  void setFilter() {
    print('hii from filters');
  }

  // void fetchSearch(query) {
  //   print(query);
  //   fetchedResult = true;
  //   result.add('product');
  //   // notifyListeners();
  // }
}
