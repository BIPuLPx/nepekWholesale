import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
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
          RatingBar(
            unratedColor: Colors.grey[350],
            ignoreGestures: true,
            initialRating: rating == 0 ? 5 : rating,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemSize: 15,
            itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
          // SmoothStarRating(
          //   rating: rating == 0 ? 5 : rating,
          //   starCount: 5,
          //   size: 18,
          //   isReadOnly: true,
          //   color: Colors.yellow[800],
          // ),
          SizedBox(width: 10),
          noOfRating(no.toString()),
        ],
      ),
    );
  }
}

Text noOfRating(String no) => Text(
      '($no)',
      style: GoogleFonts.poppins(
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
    );
