import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skite_buyer/styles/colors.dart';
import 'package:skite_buyer/styles/darkThemes/dark_theme_provider.dart';

filterAppBar(context) {
  final darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;
  return PreferredSize(
    preferredSize: Size.fromHeight(50.0), // here the desired height
    child: AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: darkTheme ? Colors.white : AppColors().primaryBlue(),
          size: 17,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
      elevation: 1,
      title: Image.asset(
        'icons/Brand.png',
        height: 16,
        color: darkTheme ? Colors.white : AppColors().primaryBlue(),
      ),

      // backgroundColor: Colors.white,
      actions: [],
    ),
  );
}
