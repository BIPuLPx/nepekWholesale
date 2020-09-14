import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ReviewStars extends StatelessWidget {
  final double rating;
  ReviewStars({this.rating});
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: SmoothStarRating(
        starCount: 5,
        rating: rating == 0 ? 5 : rating,
        size: 12,
        isReadOnly: true,
        color: Colors.yellow[800],
      ),
    );
  }
}
