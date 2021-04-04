import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/styles/colors.dart';

homeAppbar(context, bool darkTheme) {
  final deviceWidth = MediaQuery.of(context).size.width;
  // final bool darkTheme = Provider.of
  return AppBar(
    elevation: 0.5,
    title: Center(
      child: Image.asset(
        'icons/Brand.png',
        height: 23,
      ),
    ),
    // backgroundColor: Colors.white,
    actions: [
      GestureDetector(
        onTap: () {
          // Navigator.pushReplacementNamed(context, 'result',
          //     arguments: {'type': 'search', 'query': 'iphone'});

          Navigator.pushNamed(context, 'search');
        },
        child: Container(
          width: deviceWidth * 0.7,
          margin: EdgeInsets.only(top: 12, bottom: 12, right: 20),
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
                'What are you looking for ?',
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
