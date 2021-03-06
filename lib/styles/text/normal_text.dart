import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NepekText extends StatelessWidget {
  final String value;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextDecoration decoration;

  const NepekText(
    this.value, {
    this.fontSize,
    this.fontWeight,
    this.color,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        value,
        style: GoogleFonts.poppins(
          color: color == null ? Colors.black : color,
          fontSize: fontSize == null ? 15 : fontSize,
          fontWeight: fontWeight == null ? FontWeight.normal : fontWeight,
          decoration: decoration != null ? decoration : TextDecoration.none,
        ),
      ),
    );
  }
}
