import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoReviewsYet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 5),
      child: Text(
        'There are no reviews yet',
        style: GoogleFonts.nunitoSans(
          fontWeight: FontWeight.w600,
          fontSize: 17,
          // color: AppColors().secondaryText(),
        ),
      ),
    );
  }
}
