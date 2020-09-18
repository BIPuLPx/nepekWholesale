import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryHeading extends StatelessWidget {
  final String heading;
  CategoryHeading({this.heading});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Text(heading,
          style: GoogleFonts.openSans(
            color: Colors.black,
            fontSize: 14.5,
            fontWeight: FontWeight.w600,
          )),
    );
  }
}