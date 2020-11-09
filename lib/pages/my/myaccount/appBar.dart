import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:nepek_buyer/savedData/user_data.dart';
import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_provider.dart';
import 'account_provider.dart';

SliverAppBar profileAppBar(context) {
  final bool darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;
  final AccountState provider = Provider.of(context, listen: false);
  return SliverAppBar(
    title: Text(
      UserPreferences().getDisplayName(),
      style: GoogleFonts.poppins(
        // color: AppColors().primaryBlue(),
        color: darkTheme ? Colors.white : AppColors().primaryBlue(),
        fontSize: 20,
        fontWeight: FontWeight.w600,
        // fontStyle: FontStyle.italic
        // fontWeight: FontWeight.5old,
      ),
    ),
    // brightness: Brightness.light,
    // collapsedHeight: 100,
    leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: darkTheme ? Colors.white : AppColors().primaryBlue(),
          size: 18,
        ),
        onPressed: () {
          provider.args['checkProfile']();
          Navigator.of(context).pop();
        }),
    // shape: ContinuousRectangleBorder(
    //   borderRadius: BorderRadius.only(
    //     bottomLeft: Radius.circular(100),
    //     bottomRight: Radius.circular(100),
    //   ),
    // ),
    // expandedHeight: 200,
    pinned: true,
    // stretchTriggerOffset: 50,
    floating: true,
    // pinned: true,
    // backgroundColor: Colors.white,
    // toolbarHeight: 60,
    // flexibleSpace: FlexibleSpaceBar(
    //   collapseMode: CollapseMode.parallax,
    //   // centerTitle: true,
    //   title: Text(
    //     UserPreferences().getDisplayName(),
    //     style: GoogleFonts.poppins(
    //       // color: AppColors().primaryBlue(),
    //       color: darkTheme ? Colors.white : AppColors().primaryBlue(),
    //       fontSize: 20,
    //       fontWeight: FontWeight.w700,
    //       // fontStyle: FontStyle.italic
    //       // fontWeight: FontWeight.5old,
    //     ),
    //   ),
    // ),
  );
}
