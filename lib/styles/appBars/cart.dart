import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skite_buyer/styles/colors.dart';

cartAppBar(context) {
  return PreferredSize(
    preferredSize: Size.fromHeight(50.0), // here the desired height
    child: AppBar(
      brightness: Brightness.light,
      backgroundColor: Colors.white,
      elevation: 1,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios,
            color: AppColors().primaryBlue(), size: 17),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: Text(
        'Cart',
        style: GoogleFonts.actor(
            fontWeight: FontWeight.w600,
            color: AppColors().primaryBlue(),
            fontSize: 17),
      ),
      centerTitle: true,
    ),
  );
}
