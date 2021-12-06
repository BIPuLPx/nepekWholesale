import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nepek_buyer/pages/products/search/layout.dart';
import 'package:nepek_buyer/savedData/apis.dart';
import 'package:nepek_buyer/savedData/httpUri.dart';

class SearchState extends ChangeNotifier {
  Widget body = Scaffold();
  var args;
  bool initState = false;
  List autoCompletes = [];

  // void init(args) {
  //   args = args;
  //   body = SearchPageLayout();
  // }

  Future autoComplete(term) async {
    // autoCompletes = [];
    // print(autoCompletes);
    var response;
    response =
        await http.get(httpUri(serviceTwo, 'products/autocomplete?term=$term'));
    final res = jsonDecode(response.body);
    autoCompletes = res;
    // print(res);
    notifyListeners();
  }
}
