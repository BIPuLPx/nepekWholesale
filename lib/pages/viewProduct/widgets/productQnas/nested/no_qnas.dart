import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skite_buyer/styles/colors.dart';

class NoQnAsYet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 5),
      child: Text(
        'No questions has been asked yet',
        style: GoogleFonts.ptSans(
          fontWeight: FontWeight.w600,
          fontSize: 17,
          color: AppColors().secondaryText(),
        ),
      ),
    );
  }
}
