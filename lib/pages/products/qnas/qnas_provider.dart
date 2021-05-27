import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nepek_buyer/pages/products/qnas/qna_layout.dart';
import 'package:nepek_buyer/savedData/httpUri.dart';
import 'package:nepek_buyer/styles/text/end_of_result.dart';
import 'package:nepek_buyer/pages/products/result/styles/loading_more.dart';

import 'package:nepek_buyer/savedData/apis.dart';
import 'package:nepek_buyer/styles/spinkit.dart';

class QnasProvider with ChangeNotifier {
  dynamic body = logoLoader();
  bool initialFetch = false;
  dynamic loadingMore = LoadingMore(value: 'Getting More Qnas');
  String productId;
  String productName;

  List qnas = [];
  bool isNextPage;
  int nextPage = 1;
  List customerUids = [];

  List customersNames = [];

  Future fetchQnas() async {
    var response;
    response = await http.get(
        httpUri(productApi, 'qna/buyer/qnas?key=$productId&limit=8&page=1'));
    var data = jsonDecode(response.body);

    qnas.addAll(data['qnas']);
    if (data['next'] == null) {
      isNextPage = false;
      loadingMore = EndOfResult(label: "All Qnas loaded");
    } else {
      isNextPage = true;
      nextPage = nextPage + 1;
    }
    initialFetch = true;
    body = Qnas();
    notifyListeners();
  }
}
