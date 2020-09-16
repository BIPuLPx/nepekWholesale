import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductPrice extends StatelessWidget {
  final String price;
  ProductPrice({this.price});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'NPR ',
          style: GoogleFonts.openSans(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            // color: Colors.black54,
          ),
        ),
        Text(
          '$price.00',
          style: GoogleFonts.roboto(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
