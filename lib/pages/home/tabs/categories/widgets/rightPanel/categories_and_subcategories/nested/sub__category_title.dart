import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubCategoryTitle extends StatelessWidget {
  final String title;
  SubCategoryTitle({this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: Text(
        title,
        style: GoogleFonts.poppins(fontSize: 11),
        textAlign: TextAlign.center,
      ),
    );
  }
}
