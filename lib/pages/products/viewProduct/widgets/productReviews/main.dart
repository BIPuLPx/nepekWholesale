import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_product_state.dart';
import 'nested/no_reviews_yet.dart';
import 'nested/yes_reviews.dart';

class ProductReviews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ViewProductState>(context);
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 5),
      color: Colors.white,
      padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 5),
      child: product.productReviews.length > 0
          ? YesReviews(reviews: product.productReviews)
          // ? Text('hi')
          : NoReviewsYet(),
    );
  }
}
