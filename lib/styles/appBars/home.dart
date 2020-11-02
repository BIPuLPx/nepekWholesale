import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skite_buyer/styles/colors.dart';

homeAppbar(context, bool darkTheme) {
  return // here the desired height
      AppBar(
    elevation: 1,
    title: Center(
      child: Image.asset(
        'icons/Brand.png',
        height: 19,
        color: AppColors().primaryBlue(),
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
          margin: EdgeInsets.only(top: 12, bottom: 12, right: 20),
          padding: EdgeInsets.only(left: 5, right: 5),
          decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(5),
            color: darkTheme
                ? TextInputColors().darkThemeBackground()
                : Colors.white,
            boxShadow: [
              BoxShadow(
                color: AppColors().primaryBlue(),
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
                style: GoogleFonts.quicksand(
                  color: darkTheme
                      ? TextInputColors().darkThemeHintText()
                      : TextInputColors().lightThemeHintText(),
                  fontSize: 12,
                ),
              ),
              Icon(Icons.search, color: AppColors().searchBarItems(), size: 18)
            ],
          ),
          width: 220,
        ),
      )
    ],
  );
}
