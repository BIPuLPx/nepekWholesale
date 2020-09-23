import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skite_buyer/pages/reviews/reviewsLayout/widgets/rating/nested/linear_percentage_rating.dart';
import 'package:skite_buyer/pages/reviews/reviewsLayout/widgets/rating/nested/total_rating.dart';
import 'package:skite_buyer/pages/reviews/reviews_provider.dart';

class RatingCount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(top: 15),
      color: Colors.white,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TotalRating(),
          RatingBarCount(),
        ],
      ),
    );
  }
}

class RatingBarCount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final reviews = Provider.of<ReviewsState>(context);
    final reviewData = reviews.reviewData;
    final totalRating = reviews.totalRating;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PercentageRating(
          percent: reviewData['5'] / totalRating,
          progressColor: Colors.green,
          label: 'Excellent',
        ),
        PercentageRating(
          percent: reviewData['4'] / totalRating,
          progressColor: Colors.lightGreen,
          label: 'Good',
        ),
        PercentageRating(
          percent: reviewData['3'] / totalRating,
          progressColor: Colors.blue,
          label: 'Satisfactory',
        ),
        PercentageRating(
          percent: reviewData['2'] / totalRating,
          progressColor: Colors.blue[300],
          label: 'Below Average',
        ),
        PercentageRating(
          percent: reviewData['1'] / totalRating,
          progressColor: Colors.redAccent,
          label: 'Poor',
        ),
      ],
    );
  }
}
