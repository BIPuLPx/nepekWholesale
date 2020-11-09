import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_provider.dart';

Container footer(context) {
  final width = MediaQuery.of(context).size.width;
  final bool darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;
  final buttonColor = darkTheme ? Colors.white : AppColors().primaryBlue();
  return Container(
    padding: EdgeInsets.only(top: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: width * 0.4,
          height: 40,
          child: OutlineButton(
            highlightedBorderColor: buttonColor,
            borderSide: BorderSide(color: buttonColor, width: 1.6),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Continue Shopping',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w700,
                fontSize: 11.2,
                color: buttonColor,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 42,
          width: width * 0.4,
          child: FlatButton(
            onPressed: () {
              // Navigator.pop(context);
              Navigator.pushReplacementNamed(context, 'cart');
            },
            color: buttonColor,
            child: Text(
              'Go to Cart',
              style: GoogleFonts.poppins(
                color: darkTheme ? Colors.black : Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 11.2,
              ),
            ),
          ),
        )
      ],
    ),
  );
}
