import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Text heading(String val) => Text(
      val,
      style: GoogleFonts.quicksand(
        fontWeight: FontWeight.w800,
        fontSize: 17,
      ),
    );
