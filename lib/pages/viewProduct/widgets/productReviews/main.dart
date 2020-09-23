import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skite_buyer/pages/viewProduct/view_product_state.dart';
import 'package:skite_buyer/pages/viewProduct/widgets/productReviews/nested/no_reviews_yet.dart';
import 'package:skite_buyer/pages/viewProduct/widgets/productReviews/nested/yes_reviews.dart';

class ProductReviews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ViewProductState>(context);
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      color: Colors.white,
      padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 5),
      child: product.productReviews.length > 0
          ? YesReviews(reviews: product.productReviews)
          // ? Text('hi')
          : NoReviewsYet(),
    );
  }
}
