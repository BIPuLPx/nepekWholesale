import 'package:flutter/material.dart';
import 'package:nepek_buyer/styles/button/nepek_button.dart';
import 'package:provider/provider.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_provider.dart';

Container footer(context) {
  final width = MediaQuery.of(context).size.width;
  final bool darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;

  return Container(
    padding: EdgeInsets.only(top: 40),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        NepekButton(
          onClick: () => Navigator.pop(context),
          label: 'Continue Shopping',
          fontSize: 14,
          reverse: true,
          height: 45,
        ),
        NepekButton(
          onClick: () => Navigator.pushReplacementNamed(context, 'cart'),
          label: 'Go to Cart',
          width: width * 0.35,
          fontSize: 14,
          height: 45,
        ),
      ],
    ),
  );
}
