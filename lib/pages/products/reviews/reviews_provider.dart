import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:nepek_buyer/styles/text/end_of_result.dart';
import 'package:nepek_buyer/pages/products/result/styles/loading_more.dart';
import 'package:nepek_buyer/pages/products/reviews/reviewsLayout/main.dart';

import 'package:nepek_buyer/savedData/apis.dart';
import 'package:nepek_buyer/styles/spinkit.dart';

class ReviewsState extends ChangeNotifier {
  dynamic body = spinkit;
  bool initialFetch = false;
  dynamic loadingMore = LoadingMore(value: 'Getting More Products');
  String productId;
  Map reviewData;
  double rating;
  int totalRating;

  List reviews;
  bool isNextPage;
  int nextPage = 1;
  List customerUids = [];

  List customersNames = [];

  Future fetchInitialReviews() async {
    var response;
    response = await http
        .get('$productApi/products/fetch/reviews?id=$productId&limit=8&page=1');
    var data = jsonDecode(response.body);
    reviewData = data['reviewData'];
    rating = data['rating'].toDouble();
    totalRating = data['ratingNo'].toInt();
    fetchNames(data['reviews']).then((value) => null);
    reviews = data['reviews'];

    if (data['next'] == null) {
      isNextPage = false;
      loadingMore = EndOfResult(label: 'All reviews loaded');
    } else {
      isNextPage = true;
      nextPage = nextPage + 1;
    }
    initialFetch = true;
    if (initialFetch = true) {
      body = ReviewsLayout();
    }

    notifyListeners();
  }

  Future fetchReviews(int page) async {
    if (isNextPage == true) {
      var response;
      response = await http.get(
          '$productApi/products/fetch/reviews?id=$productId&limit=5&page=$page');
      final data = jsonDecode(response.body);

      if (data['reviews'].length > 0) {
        reviews.addAll(data['reviews']);
      }

      if (data['next'] == null) {
        isNextPage = false;
      } else {
        isNextPage = true;
        nextPage += 1;
      }
      fetchNames(data['reviews']);
    } else {
      loadingMore = EndOfResult();
    }
    notifyListeners();
  }

  Future fetchNames(List reviews) async {
    for (var review in reviews) {
      if (!customerUids.contains(review['customer_uid'])) {
        customerUids.add(review['customer_uid']);
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
