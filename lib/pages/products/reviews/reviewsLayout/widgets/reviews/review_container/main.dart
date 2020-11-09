import 'package:flutter/material.dart';
import 'package:nepek_buyer/pages/reviews/reviewsLayout/widgets/reviews/review_container/nested/review_body.dart';
import 'package:nepek_buyer/pages/reviews/reviewsLayout/widgets/reviews/review_container/nested/review_date.dart';
import 'package:nepek_buyer/pages/reviews/reviewsLayout/widgets/reviews/review_container/nested/review_header.dart';

class ReviewsContainer extends StatelessWidget {
  final String review;
  final String date;
  final String name;
  final double rating;
  const ReviewsContainer(
      {Key key, this.review, this.date, this.name, this.rating})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.all(8),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReviewHeader(name: name, rating: rating),
          Review(
              review: review +
                  'hmgbdfsjhgjdfsbg hfjsdghfjg dhfjsgf hjdfsjhdf hjdgfshjgdfs hjgdfs hjg'),
          ReviewDate(date: date),
        ],
      ),
    );
  }
}
