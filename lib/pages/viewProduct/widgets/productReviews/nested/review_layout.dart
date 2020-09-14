import 'package:flutter/material.dart';
import 'package:skite_buyer/pages/viewProduct/widgets/productReviews/nested/review_date.dart';
import 'package:skite_buyer/pages/viewProduct/widgets/productReviews/nested/review_stars.dart';
import 'package:skite_buyer/pages/viewProduct/widgets/productReviews/nested/review_text.dart';

class ReviewLayout extends StatelessWidget {
  final String review;
  final double rating;
  final String date;

  ReviewLayout({this.review, this.rating, this.date});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReviewStars(rating: rating),
          ReviewText(
              text: review +
                  'dgfhjsbdghfjbdjsf dhfjs gjfgjsfhfsdhkh hsdfkjhfds kjhdfkjshkjhf'),
          ReviewDate(date: date)
        ],
      ),
    );
  }
}
