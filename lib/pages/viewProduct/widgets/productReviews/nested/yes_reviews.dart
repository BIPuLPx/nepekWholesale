import 'package:flutter/material.dart';
import 'package:skite_buyer/pages/viewProduct/widgets/productReviews/nested/review_layout.dart';
import 'package:skite_buyer/pages/viewProduct/widgets/productReviews/nested/reviews_heading.dart';

class YesReviews extends StatelessWidget {
  final List reviews;
  YesReviews({this.reviews});
  @override
  Widget build(BuildContext context) {
    print(reviews);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Heading(),
        Column(
          children: reviews
              .map((review) => ReviewLayout(
                    review: review['review'],
                    rating: review['rating'].toDouble(),
                    date: review['date'],
                    index: reviews.indexOf(review),
                    length: reviews.length,
                  ))
              .toList(),
        ),
      ],
    );
  }
}
