import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skite_buyer/savedData/user_data.dart';
import 'package:skite_buyer/styles/colors.dart';
import 'package:skite_buyer/styles/darkThemes/dark_theme_provider.dart';

SliverAppBar profileAppBar(context) {
  final bool darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;
  return SliverAppBar(
    // brightness: Brightness.light,
    // collapsedHeight: 100,
    leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          size: 18,
          color: AppColors().primaryBlue(),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        }),
    // shape: ContinuousRectangleBorder(
    //   borderRadius: BorderRadius.only(
    //     bottomLeft: Radius.circular(100),
    //     bottomRight: Radius.circular(100),
    //   ),
    // ),
    expandedHeight: 200,
    pinned: true,
    // stretchTriggerOffset: 50,
    floating: true,
    // pinned: true,
    backgroundColor: Colors.white,
    toolbarHeight: 60,
    flexibleSpace: FlexibleSpaceBar(
      collapseMode: CollapseMode.parallax,
      // centerTitle: true,
      title: Text(
        UserPreferences().getDisplayName(),
        style: GoogleFonts.cabin(
          // color: AppColors().primaryBlue(),
          color: darkTheme ? Colors.white : AppColors().primaryBlue(),
          fontSize: 20,
          fontWeight: FontWeight.w400,
          // fontStyle: FontStyle.italic
          // fontWeight: FontWeight.5old,
        ),
      ),
    ),
  );
}
