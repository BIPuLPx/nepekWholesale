import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class Rating extends StatelessWidget {
  final double rating;
  final int no;

  const Rating({Key key, this.rating, this.no}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          SmoothStarRating(
            rating: rating == 0 ? 5 : rating,
            starCount: 5,
            size: 18,
            isReadOnly: true,
            color: Colors.yellow[800],
          ),
          SizedBox(width: 10),
          noOfRating(no.toString()),
        ],
      ),
    );
  }
}

Text noOfRating(String no) => Text(
      '($no)',
      style: TextStyle(fontWeight: FontWeight.bold),
    );
