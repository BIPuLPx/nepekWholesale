import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

Text applyText(Color color) => Text(
      'Apply',
      style: GoogleFonts.quicksand(
        fontWeight: FontWeight.w600,
        color: color,
      ),
    );

SpinKitRipple applySpinKit(Color color) => SpinKitRipple(
      color: color,
      size: 50.0,
    );
