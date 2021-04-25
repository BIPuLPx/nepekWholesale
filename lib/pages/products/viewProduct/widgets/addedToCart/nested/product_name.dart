import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/styles/text/trimName.dart';

class ProductName extends StatelessWidget {
  final String name;
  ProductName({this.name});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.5;
    return Container(
      width: width,
      child: Text(
        trimName(name, 20),
        style: GoogleFonts.poppins(
          height: 1.3,
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
