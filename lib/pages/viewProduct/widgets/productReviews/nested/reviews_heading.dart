import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skite_buyer/pages/viewProduct/view_product_state.dart';
import 'package:skite_buyer/styles/colors.dart';
import 'package:skite_buyer/styles/darkThemes/dark_theme_provider.dart';

class Heading extends StatelessWidget {
  final String heading;
  Heading({this.heading});
  @override
  Widget build(BuildContext context) {
    final bool darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    final product = Provider.of<ViewProductState>(context);

    final buttonColor = darkTheme ? Colors.white : AppColors().primaryBlue();
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            heading,
            style: GoogleFonts.nunitoSans(
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
              onPressed: () {
                Navigator.pushNamed(context, 'reviews',
                    arguments: {'id': product.productID});
              },
              child: Text(
                'View All',
                style: GoogleFonts.nunitoSans(
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
