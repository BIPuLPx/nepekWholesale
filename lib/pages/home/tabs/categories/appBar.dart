import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/styles/colors.dart';

categoryAppBar(context, bool darkTheme) {
  final deviceWidth = MediaQuery.of(context).size.width;
  // final bool darkTheme = Provider.of
  return AppBar(
    elevation: 0,
    // title: Center(
    //   child: Image.asset(
    //     'icons/Brand.png',
    //     height: 23,
    //   ),
    // ),
    // backgroundColor: Colors.white,
    actions: [
      GestureDetector(
        onTap: () {
          // Navigator.pushReplacementNamed(context, 'result',
          //     arguments: {'type': 'search', 'query': 'iphone'});

          Navigator.pushNamed(context, 'search');
        },
        child: Container(
          width: deviceWidth - 20,
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(5),
            color: darkTheme
                ? TextInputColors().darkThemeBackground()
                : Colors.white,
            boxShadow: [
              BoxShadow(
                color: AppColors().officialMatch(),
                spreadRadius: 0.5,
                blurRadius: 2,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Search for products',
                style: GoogleFonts.poppins(
                  color: darkTheme
                      ? TextInputColors().darkThemeHintText()
                      : TextInputColors().lightThemeHintText(),
                  fontSize: 12,
                ),
              ),
              Icon(Icons.search, color: AppColors().searchBarItems(), size: 18)
            ],
          ),
        ),
      )
    ],
  );
}
