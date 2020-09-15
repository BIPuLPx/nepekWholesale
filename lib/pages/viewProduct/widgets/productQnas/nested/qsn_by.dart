import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skite_buyer/styles/colors.dart';

class QsnBy extends StatelessWidget {
  final String name;
  QsnBy({this.name});
  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: GoogleFonts.roboto(
        color: AppColors().secondaryText(),
        fontSize: 12,
      ),
    );
  }
}
