import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/styles/colors.dart';

class QAGraphics extends StatelessWidget {
  final String text;
  QAGraphics({this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: text == 'Q' ? AppColors().primaryBlue() : Colors.grey,
      ),
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.only(top: 1, bottom: 2.5, left: 4, right: 4),
      child: Text(text,
          style: GoogleFonts.notoSans(
            fontSize: 10,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          )),
    );
  }
}
