import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/styles/rating.dart' as NepekRating;

class Rating extends StatelessWidget {
  final double rating;
  final int no;
  const Rating({Key key, this.rating, this.no}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return no > 0
        ? Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NepekRating.Rating(
                  rating: rating,
                  size: 14,
                ),
                SizedBox(width: 10),
                noOfRating(no.toString()),
              ],
            ),
          )
        : SizedBox();
  }
}

Text noOfRating(String no) => Text(
      '($no)',
      style: GoogleFonts.poppins(
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
    );
