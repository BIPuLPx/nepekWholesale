import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EndOfResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 5, top: 10, bottom: 10),
      child: Text(
        'End of Result',
        style: GoogleFonts.quicksand(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
