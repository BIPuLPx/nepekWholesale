import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skite_buyer/pages/viewProduct/view_product_state.dart';
import 'package:skite_buyer/styles/colors.dart';
import 'package:skite_buyer/styles/darkThemes/dark_theme_provider.dart';

class QnaHeading extends StatelessWidget {
  final String heading;
  QnaHeading({this.heading});
  @override
  Widget build(BuildContext context) {
    final bool darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    final buttonColor = darkTheme ? Colors.white : AppColors().primaryBlue();
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            heading,
            style: GoogleFonts.cabin(
              // color: AppColors().primaryText(),
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
          SizedBox(
            height: 25,
            width: 80,
            child: OutlineButton(
              highlightedBorderColor: buttonColor,
              borderSide: BorderSide(color: buttonColor, width: 1.6),
              onPressed: () {},
              child: Text(
                'View All',
                style: GoogleFonts.roboto(
                  color: buttonColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
