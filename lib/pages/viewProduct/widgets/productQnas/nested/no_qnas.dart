import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoQnAsYet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20),
      child: Text(
        'No questions has been asked yet',
        style: GoogleFonts.nunitoSans(
          fontWeight: FontWeight.w600,
          fontSize: 17,
        ),
      ),
    );
  }
}
