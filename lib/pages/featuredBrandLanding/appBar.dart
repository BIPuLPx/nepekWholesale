import 'package:flutter/material.dart';
import 'package:nepek_buyer/styles/colors.dart';

featuredAppBar(context) {
  return PreferredSize(
    preferredSize: Size.fromHeight(50.0), // here the desired height
    child: AppBar(
      // shape: ContinuousRectangleBorder(
      // borderRadius: BorderRadius.only(
      // bottomLeft: Radius.circular(100),
      // bottomRight: Radius.circular(100),
      // ),
      // ),
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: AppColors().officialMatch(),
          size: 17,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
      // brightness: Brightness.light,
      backgroundColor: Colors.white,
      elevation: 1,
      title: Image.asset(
        'icons/Brand.png',
        height: 16,
        color: AppColors().officialMatch(),
      ),

      // backgroundColor: Colors.white,
      actions: [],
    ),
  );
}
