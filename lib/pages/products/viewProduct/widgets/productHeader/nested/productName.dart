import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/styles/extensions.dart';

class ProductName extends StatelessWidget {
  final String name;
  ProductName({this.name});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: Wrap(
        children: [
          Text(
            capitalize(name),
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500
            ),
          ),
        ],
      ),
    );
  }
}
