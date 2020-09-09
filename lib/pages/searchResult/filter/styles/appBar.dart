import 'package:flutter/material.dart';
import 'package:skite_buyer/styles/colors.dart';

filterAppBar(context) {
  return PreferredSize(
    preferredSize: Size.fromHeight(50.0), // here the desired height
    child: AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: AppColors().primaryBlue(),
          size: 17,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
      brightness: Brightness.light,
      backgroundColor: AppColors().transparentAppbar(),
      elevation: 1,
      title: Image.asset(
        'icons/Brand.png',
        height: 16,
        color: AppColors().primaryBlue(),
      ),

      // backgroundColor: Colors.white,
      actions: [],
    ),
  );
}
