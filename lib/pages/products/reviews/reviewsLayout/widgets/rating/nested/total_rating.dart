import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:nepek_buyer/styles/colors.dart';

import '../../../../reviews_provider.dart';

class TotalRating extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final review = Provider.of<ReviewsState>(context);
    print(review.ratingMetaData);
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RatingBar.builder(
            initialRating: review.ratingMetaData['rating'],
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            ignoreGestures: true,
            itemCount: 5,
            itemSize: 30,
            itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
          Column(
            children: [
              Text(
                review.ratingMetaData['rating'].toStringAsFixed(2),
                style: totalRatingText('rating'),
              ),
              Text(
                'based on ${review.ratingMetaData['ratingNo'].toString()} reviews',
                style: totalRatingText('footer'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

TextStyle totalRatingText(String type) => GoogleFonts.poppins(
      fontWeight: type == 'rating' ? FontWeight.w700 : FontWeight.w400,
      fontSize: type == 'rating' ? 25 : 12,
      color: type == 'rating' ? AppColors.primaryText : AppColors.secondaryText,
    );
