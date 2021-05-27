import 'package:flutter/material.dart';
import 'package:nepek_buyer/pages/my/to_review/provider.dart';
import 'package:nepek_buyer/styles/appBars/default_app_bar.dart';
import 'package:provider/provider.dart';

class ToReview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ToReviewProvider(),
      child: ToReviewRoot(),
    );
  }
}

class ToReviewRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ToReviewProvider provider = Provider.of(context);
    if (!provider.initFetched) provider.getReviews();

    return Scaffold(
      appBar: defaultAppBar(
        context,
        provider.type == "left" ? 'To Review' : 'Review History',
        false,
      ),
      body: provider.body,
    );
  }
}
