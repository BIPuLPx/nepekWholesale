import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:skite_buyer/styles/colors.dart';

class Date extends StatelessWidget {
  final String date;
  Date({this.date});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        DateFormat.yMMMd('en_US').format(DateTime.parse(date)),
        style: GoogleFonts.roboto(
          color: AppColors().secondaryText(),
          fontSize: 12,
        ),
      ),
    );
  }
}
