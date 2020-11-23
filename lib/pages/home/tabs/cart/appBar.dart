import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/styles/colors.dart';

cartAppBar(context) {
  return PreferredSize(
    preferredSize: Size.fromHeight(50.0), // here the desired height
    child: AppBar(
      // brightness: Brightness.light,
      backgroundColor: Colors.white,
      elevation: 1,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios,
            color: AppColors().officialMatch(), size: 17),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: Text(
        'Cart',
        style: GoogleFonts.actor(
            fontWeight: FontWeight.w600,
            color: AppColors().officialMatch(),
            fontSize: 17),
      ),
      centerTitle: true,
    ),
  );
}
