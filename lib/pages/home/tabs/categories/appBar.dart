import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/text/normal_text.dart';

categoryAppBar(context, bool darkTheme) {
  final deviceWidth = MediaQuery.of(context).size.width;
  // final bool darkTheme = Provider.of
  return PreferredSize(
    preferredSize: Size.fromHeight(65.0),
    child: AppBar(
      elevation: 0,
      title: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, 'search');
        },
        child: Container(
          height: 40,
          margin: EdgeInsets.symmetric(vertical: 10),
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: darkTheme
                ? TextInputColors().darkThemeBackground()
                : Colors.white,
            border: Border.all(
              color: Colors.grey.shade300,
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 0,
                blurRadius: 2,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NepekText(
                'What are you looking for ?',
                fontSize: 14,
                color: Colors.grey,
              ),
              Icon(
                Icons.search,
                color: Colors.grey,
                size: 20,
              )
            ],
          ),
        ),
      ),
    ),
  );
}
