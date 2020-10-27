import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skite_buyer/styles/colors.dart';

defaultAppBar(context, String title, bool darktheme) {
  return 
    // preferredSize: Size.fromHeight(50.0), // here the desired height
     AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: darktheme ? Colors.white : AppColors().primaryBlue(),
          size: 17,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
      // centerTitle: true,
      // backgroundColor: AppColors().transparentAppbar(),
      elevation: 1,
      title: Text(
        title,
        style: GoogleFonts.nunitoSans(
          fontSize: 18,
          color: darktheme ? Colors.white : AppColors().primaryBlue(),
          fontWeight: FontWeight.w600
        ),
      ),
      // brightness: Brightness.light,

      // backgroundColor: Colors.white,
      actions: [],
  );
}
