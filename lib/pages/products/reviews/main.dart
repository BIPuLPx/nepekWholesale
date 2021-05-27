import 'package:flutter/material.dart';
import 'package:nepek_buyer/styles/appBars/default_app_bar.dart';
import 'package:provider/provider.dart';

import 'reviews_provider.dart';
// import 'package:percent_indicator/linear_percent_indicator.dart';

class ReviewsPage extends StatelessWidget {
  final args;
  const ReviewsPage({Key key, this.args}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ReviewsState>(
      create: ((context) => ReviewsState()),
      child: ReviewsRoot(args: args),
    );
  }
}

class ReviewsRoot extends StatelessWidget {
  final args;
  const ReviewsRoot({Key key, this.args}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final reviews = Provider.of<ReviewsState>(context);

    if (reviews.initialFetch == false) {
      reviews.productId = args['id'];
      reviews.fetchReviews();
    }
    return Scaffold(
      appBar: defaultAppBar(context, 'Reviews', false),
      body: SafeArea(child: reviews.body),
    );
  }
}
