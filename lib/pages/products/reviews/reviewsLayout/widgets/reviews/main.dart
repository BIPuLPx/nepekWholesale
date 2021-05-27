import 'package:flutter/material.dart';
import 'package:nepek_buyer/pages/products/viewProduct/widgets/productReviews/nested/review_layout.dart';
import 'package:provider/provider.dart';

import '../../../reviews_provider.dart';

class Reviews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final reviews = Provider.of<ReviewsState>(context);
    return Column(
      children: reviews.reviews
          .map(
            (review) => Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(10),
              color: Colors.white,
              child: ReviewLayout(review: review),
            ),
          )
          .toList(),
    );
  }
}
