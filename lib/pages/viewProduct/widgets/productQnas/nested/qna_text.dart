import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skite_buyer/pages/viewProduct/widgets/productQnas/nested/qa_graphics.dart';

class QnaText extends StatelessWidget {
  final String insideGraphics;
  final String text;
  QnaText({this.insideGraphics, this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QAGraphics(text: insideGraphics),
          Flexible(
            child: Text(
              text,
              style: GoogleFonts.quicksand(
                fontWeight: FontWeight.w500,
                height: 1.3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
