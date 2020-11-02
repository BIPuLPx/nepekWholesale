import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Date extends StatelessWidget {
  final String date;
  Date({this.date});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        DateFormat.yMMMd('en_US').format(DateTime.parse(date)),
        style: GoogleFonts.quicksand(
          fontSize: 12,
          color: Colors.grey,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
