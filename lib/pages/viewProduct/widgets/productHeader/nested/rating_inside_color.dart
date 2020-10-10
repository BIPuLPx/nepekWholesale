import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skite_buyer/styles/colors.dart';
import 'package:skite_buyer/styles/font_styles.dart';

class RatingNo extends StatelessWidget {
  final double rating;
  final int noOfReviews;
  RatingNo({this.rating, this.noOfReviews});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15, bottom: 5),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(top: 5, bottom: 5),
            padding: EdgeInsets.only(left: 5, right: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColors().ratingColor(),
            ),
            child: Text(
              '$rating',
              style: ProductPageFonts().ratingNumberinsideColor(),
            ),
          ),
          SizedBox(width: 10),
          Text(
            '$noOfReviews reviews',
            style: GoogleFonts.cabinCondensed(
              fontSize: 12.5,
              decoration: TextDecoration.underline,
            ),
          )
        ],
      ),
    );
  }
}
