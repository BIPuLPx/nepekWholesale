import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:nepek_buyer/styles/colors.dart';

class SearchHistoryHeading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Recents',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w700,
            ),
          ),
          InkWell(
            onTap: () {
              Hive.box('search').clear();
            },
            child: Container(
              padding: EdgeInsets.only(top: 5, bottom: 5),
              width: 100,
              child: Text(
                'Clear',
                textAlign: TextAlign.right,
                style: GoogleFonts.rubik(
                  color: AppColors().primaryBlue(),
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
