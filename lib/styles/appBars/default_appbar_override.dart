import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/styles/colors.dart';

defaultAppBarOverride(BuildContext context, String title, Function backBtn) =>
    AppBar(
      elevation: 0,
      leading: IconButton(
        onPressed: backBtn,
        icon: Icon(
          Icons.arrow_back_ios_rounded,
          color: AppColors.officialMatch,
        ),
      ),
      backgroundColor: Colors.white,
      title: Text(
        title,
        style: GoogleFonts.poppins(
          color: AppColors.officialMatch,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      centerTitle: true,
    );
