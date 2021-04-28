import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/font_styles.dart';

import 'prices_down_container.dart';

class PricesDown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 15),
      color: AppColors.officialMatch,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: Text(
              'Prices Down',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
          Center(
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: <Widget>[
                PricesDownProduct(),
                PricesDownProduct(),
                PricesDownProduct(),
                PricesDownProduct(),
                PricesDownProduct(),
                PricesDownProduct(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
