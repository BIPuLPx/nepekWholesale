import 'package:flutter/material.dart';
import 'package:skite_buyer/pages/viewProduct/widgets/productReviews/nested/review_layout.dart';
import 'package:skite_buyer/pages/viewProduct/widgets/productReviews/nested/reviews_heading.dart';

class YesReviews extends StatelessWidget {
  final List reviews;
  YesReviews({this.reviews});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Heading(heading: 'Reviews'),
        Column(
          children: reviews
              .map((review) => ReviewLayout(
                    review: review['review'],
                    rating: review['rating'],
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
