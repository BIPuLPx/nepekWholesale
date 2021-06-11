import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:nepek_buyer/functions/token_header.dart';
import 'package:nepek_buyer/pages/my/to_review/views/no_history/main.dart';
import 'package:nepek_buyer/pages/my/to_review/views/no_reviews/main.dart';
import 'package:nepek_buyer/pages/my/to_review/views/yes_history/main.dart';
import 'package:nepek_buyer/pages/my/to_review/views/yes_reviews/main.dart';
import 'package:nepek_buyer/savedData/apis.dart';
import 'package:nepek_buyer/savedData/httpUri.dart';
import 'package:nepek_buyer/styles/spinkit.dart';

class ToReviewProvider with ChangeNotifier {
  Widget body = logoLoader();
  bool initFetched = false;
  List toReview = [];
  String type = 'left';

  Future getReviews() async {
    final res = await get(
      httpUri(serviceOne, 'buy_system/buyer/to_review?type=$type'),
      headers: tokenHeader(),
    );
    toReview = jsonDecode(res.body);
    if (toReview.length > 0) {
      if (type == 'left')
        body = YesReviews();
      else
        body = YesHistory();
    } else {
      if (type == 'left')
        body = NoReviews();
      else
        body = NoHistory();
    }

    initFetched = true;
    notifyListeners();
  }

  refresh() {
    toReview = [];
    body = logoLoader();
    initFetched = false;
    notifyListeners();
  }

  history() {
    type = 'history';
    refresh();
  }
}
