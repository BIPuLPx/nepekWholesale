import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFontStyle {
  button(Color color) => GoogleFonts.rubik(
        color: color,
        fontSize: 14.5,
        fontWeight: FontWeight.w500,
      );
  subFilters() => GoogleFonts.openSans(
        fontSize: 14,
        fontWeight: FontWeight.w600,
      );
}
