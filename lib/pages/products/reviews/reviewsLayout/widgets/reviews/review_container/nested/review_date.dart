import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:nepek_buyer/styles/colors.dart';

class ReviewDate extends StatelessWidget {
  final String date;
  ReviewDate({this.date});
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Text(
        DateFormat.yMMMd('en_US').format(DateTime.parse(date)),
        style: GoogleFonts.roboto(
          color: AppColors.secondaryText,
          fontSize: 12,
        ),
      ),
    );
  }
}
