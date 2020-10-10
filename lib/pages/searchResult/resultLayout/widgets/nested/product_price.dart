import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductPrice extends StatelessWidget {
  final int price;

  const ProductPrice({Key key, this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('NPR ', style: GoogleFonts.cabin(fontWeight: FontWeight.w800)),
        Text(price.toString(), style: GoogleFonts.cabin()),
      ],
    );
  }
}
