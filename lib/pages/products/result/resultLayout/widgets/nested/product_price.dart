import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductPrice extends StatelessWidget {
  final int price;

  const ProductPrice({Key key, this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'NPR ',
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          '${price.toString()}.00',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
