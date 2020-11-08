import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Text heading(String val) => Text(
      val,
      style: GoogleFonts.poppins(
        fontWeight: FontWeight.w700,
        fontSize: 17,
      ),
    );
