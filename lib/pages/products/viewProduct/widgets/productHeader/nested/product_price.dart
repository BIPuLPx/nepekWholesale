import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductPrice extends StatelessWidget {
  final String price;
  ProductPrice({this.price});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'NPR  ',
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              // color: AppColors().primaryText(),
            ),
          ),
          Text(
            '$price.00',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          // SizedBox(width: 10),
          // Text(
          //   '(VAT included)',
          //   style: GoogleFonts.robotoCondensed(fontSize: 11.2),
          // )
        ],
      ),
    );
  }
}
