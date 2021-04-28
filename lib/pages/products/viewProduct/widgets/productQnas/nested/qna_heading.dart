import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/pages/products/viewProduct/styles/heading.dart';
import 'package:nepek_buyer/styles/button/nepek_button.dart';
import 'package:provider/provider.dart';
import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_provider.dart';

import '../../../view_product_state.dart';

class QnaHeading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bool darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    final buttonColor = darkTheme ? Colors.white : AppColors.officialMatch;
    final provider = Provider.of<ViewProductState>(context);
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          heading('Questions And Answers'),
          NepekButton(
            height: 35,
            fontSize: 11,
            padding: 8,
            onClick: () {
              Navigator.pushNamed(context, 'qnas', arguments: {
                'id': provider.productID,
                'product': provider.productName
              });
            },
            label: 'View all',
          ),
        ],
      ),
    );
  }
}
