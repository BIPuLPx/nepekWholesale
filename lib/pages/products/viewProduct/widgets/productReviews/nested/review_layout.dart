import 'package:flutter/material.dart';

import 'review_date.dart';
import 'review_stars.dart';
import 'review_text.dart';


class ReviewLayout extends StatelessWidget {
  final String review;
  final double rating;
  final String date;
  final int index;
  final int length;

  ReviewLayout({this.review, this.rating, this.date, this.index, this.length});
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
          ReviewDate(date: date),
          index == length - 1
              ? Container()
              : Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 2,
                  color: Colors.grey[300],
                )
        ],
      ),
    );
  }
}
