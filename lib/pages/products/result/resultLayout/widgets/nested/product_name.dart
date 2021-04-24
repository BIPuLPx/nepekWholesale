import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/styles/text/trimName.dart';

class ProductName extends StatelessWidget {
  final String name;

  const ProductName({Key key, this.name}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        trimName(name, 50),
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
