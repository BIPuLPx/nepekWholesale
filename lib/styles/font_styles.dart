import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skite_buyer/styles/colors.dart';

class AppFontStyle {
  button(Color color) => GoogleFonts.rubik(
        color: color,
        fontSize: 14.5,
        fontWeight: FontWeight.w500,
      );
  subFilters() => GoogleFonts.openSans(
        fontSize: 14,
        fontWeight: FontWeight.w600,
      );
}

class ProductPageFonts {
  brand() => GoogleFonts.hammersmithOne(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        color: AppColors().primaryBlue(),
      );
  productName() => GoogleFonts.roboto(
        height: 1.4,
      );
  ratingNumberinsideColor() => GoogleFonts.openSans(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      );
  ratingNumberSideReviews() => GoogleFonts.robotoCondensed(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors().secondaryText(),
        decoration: TextDecoration.underline,
      );
  productPrice(FontWeight fontWeight) => GoogleFonts.openSans(
        fontWeight: fontWeight,
        color: AppColors().primaryText(),
        fontSize: 18,
      );
}

class HomeFonts {
  Container heading(String text) => Container(
        margin: EdgeInsets.only(bottom: 0, left: 15),
        child: Text(
          text,
          style: GoogleFonts.quicksand(
            fontWeight: FontWeight.w800,
            fontSize: 18,
          ),
        ),
      );
}
