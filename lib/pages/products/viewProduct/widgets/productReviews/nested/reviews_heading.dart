import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/pages/products/viewProduct/styles/heading.dart';
import 'package:nepek_buyer/styles/button/nepek_button.dart';
import 'package:provider/provider.dart';

import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_provider.dart';

import '../../../view_product_state.dart';

class Heading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bool darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    final product = Provider.of<ViewProductState>(context);

    final buttonColor = darkTheme ? Colors.white : AppColors.officialMatch;
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          heading('Reviews'),
          NepekButton(
            height: 35,
            fontSize: 11,
            padding: 8,
            onClick: () {
              Navigator.pushNamed(context, 'reviews',
                  arguments: {'id': product.productID});
            },
            label: 'View all',
          ),
        ],
      ),
    );
  }
}
