import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:nepek_buyer/savedData/httpUri.dart';
import 'package:nepek_buyer/styles/text/end_of_result.dart';
import 'package:nepek_buyer/pages/products/result/styles/loading_more.dart';
import 'package:nepek_buyer/pages/products/reviews/reviewsLayout/main.dart';

import 'package:nepek_buyer/savedData/apis.dart';
import 'package:nepek_buyer/styles/spinkit.dart';

class ReviewsState extends ChangeNotifier {
  dynamic body = logoLoader();
  bool initialFetch = false;
  dynamic loadingMore = LoadingMore(value: 'Getting More Products');
  String productId;
  String productName;
  Map ratingMetaData;
  Map reviewsMetaData;
  List reviews = [];
  bool isNextPage;
  int nextPage = 1;

  Future fetchReviews() async {
    var response;
    response = await http.get(
      httpUri(
        productApi,
        'reviews/buyer/reviews?key=$productId&limit=8&page=$nextPage',
      ),
    );
    var data = jsonDecode(response.body);

    // rating = data['rating'].toDouble();
    // totalRating = data['ratingNo'].toInt();
    reviews.addAll(data['reviews']);

    if (nextPage == 1) {
      ratingMetaData = data['ratingMetaData'];
      reviewsMetaData = data['reviewsMetaData'];
    }

    if (data['next'] == null) {
      isNextPage = false;
      loadingMore = EndOfResult(label: 'All reviews loaded');
    } else {
      isNextPage = true;
      nextPage = nextPage + 1;
    }
    if (initialFetch != true) {
      initialFetch = true;
      body = ReviewsLayout();
    }
    notifyListeners();
  }
}
