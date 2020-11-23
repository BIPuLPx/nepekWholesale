import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/pages/products/viewProduct/styles/heading.dart';
import 'package:provider/provider.dart';
import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_provider.dart';

import '../../../view_product_state.dart';

class QnaHeading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bool darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    final buttonColor = darkTheme ? Colors.white : AppColors().officialMatch();
    final provider = Provider.of<ViewProductState>(context);
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          heading('Questions And Answers'),
          SizedBox(
            height: 25,
            width: 100,
            child: OutlineButton(
              highlightedBorderColor: buttonColor,
              borderSide: BorderSide(color: buttonColor, width: 1.6),
              onPressed: () {
                Navigator.pushNamed(context, 'qnas',
                    arguments: {'id': provider.productID});
              },
              child: Text(
                'VIEW ALL',
                style: GoogleFonts.poppins(
                  color: buttonColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
