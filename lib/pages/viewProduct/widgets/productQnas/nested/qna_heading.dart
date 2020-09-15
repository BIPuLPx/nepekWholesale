import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skite_buyer/styles/colors.dart';

class QnaHeading extends StatelessWidget {
  final String heading;
  QnaHeading({this.heading});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            heading,
            style: GoogleFonts.openSans(
              color: AppColors().primaryText(),
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
          SizedBox(
            height: 25,
            width: 80,
            child: OutlineButton(
              highlightedBorderColor: AppColors().primaryBlue(),
              borderSide:
                  BorderSide(color: AppColors().primaryBlue(), width: 1.6),
              onPressed: () {},
              child: Text(
                'View All',
                style: GoogleFonts.roboto(
                  color: AppColors().primaryBlue(),
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
