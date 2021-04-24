import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nepek_buyer/pages/products/qnas/qna_layout.dart';
import 'package:nepek_buyer/pages/products/result/styles/end_of_result.dart';
import 'package:nepek_buyer/pages/products/result/styles/loading_more.dart';

import 'package:nepek_buyer/savedData/apis.dart';
import 'package:nepek_buyer/styles/spinkit.dart';

class QnasProvider with ChangeNotifier {
  dynamic body = spinkit;
  bool initialFetch = false;
  dynamic loadingMore = LoadingMore(value: 'Getting More Qnas');
  String productId;

  List qnas;
  bool isNextPage;
  int nextPage = 1;
  List customerUids = [];

  List customersNames = [];

  Future fetchInitialReviews() async {
    var response;
    response = await http
        .get('$productApi/qna/buyer/qnas?key=$productId&limit=8&page=1');
    var data = jsonDecode(response.body);
    fetchNames(data['qnas']).then((_) {
      qnas = data['qnas'];

      if (data['next'] == null) {
        isNextPage = false;
        loadingMore = EndOfResult();
      } else {
        isNextPage = true;
        nextPage = nextPage + 1;
      }
      initialFetch = true;
      body = Qnas();
      notifyListeners();
    });
  }

  Future fetchReviews(int page) async {
    if (isNextPage == true) {
      var response;
      response = await http
          .get('$productApi/qna/buyer/qnas?key=$productId&limit=5&page=$page');
      final data = jsonDecode(response.body);

      if (data['qnas'].length > 0) {
        qnas.addAll(data['qnas']);
      }

      if (data['next'] == null) {
        isNextPage = false;
      } else {
        isNextPage = true;
        nextPage += 1;
      }
      fetchNames(data['qnas']);
    } else {
      loadingMore = EndOfResult();
    }
    notifyListeners();
  }

  Future fetchNames(List reviews) async {
    for (var review in reviews) {
      if (!customerUids.contains(review['buyer_id'])) {
        customerUids.add(review['buyer_id']);
      }
    }

    final response = await http.post(
      '$peopleApi/customers/get_name',
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({'uids': customerUids}),
    );
    final data = jsonDecode(response.body);

    customersNames.addAll(data);
    // return customersNames;

    // print(jsonDecode(response.body));
  }

  String getName(String uid) {
    for (var name in customersNames) {
      if (uid == name['uid']) {
        return name['displayName'];
      }
    }
    return 'No Name';
  }
}
