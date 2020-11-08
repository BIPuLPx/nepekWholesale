import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:nepek_buyer/pages/viewProduct/view_product_state.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_provider.dart';

class ProductHighlights extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ViewProductState>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: product.productHighlights
          .map((highlight) => HighlightsText(text: highlight))
          .toList(),
    );
  }
}

class HighlightsText extends StatelessWidget {
  final String text;
  HighlightsText({this.text});
  @override
  Widget build(BuildContext context) {
    final bool darktheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(top: 2),
            height: 8,
            width: 8,
            decoration: BoxDecoration(
                color: darktheme ? Colors.white : Colors.black,
                borderRadius: BorderRadius.circular(5)),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.poppins(height: 1.7),
            ),
          ),
        ],
      ),
    );
  }
}
