import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReviewText extends StatelessWidget {
  final String text;
  ReviewText({this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Text(
        text,
        style: GoogleFonts.roboto(height: 1.4
            // color: AppColors().secondaryText(),
            ),
      ),
    );
  }
}
