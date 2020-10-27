import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QsnBy extends StatelessWidget {
  final String name;
  QsnBy({this.name});
  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: GoogleFonts.cabin(
        fontSize: 12,
      ),
    );
  }
}
