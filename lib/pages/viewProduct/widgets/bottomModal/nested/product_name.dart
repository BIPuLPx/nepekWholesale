import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductName extends StatelessWidget {
  final String name;
  ProductName({this.name});
  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: GoogleFonts.cabin(
        height: 1.3,
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
