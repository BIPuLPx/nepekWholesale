import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skite_buyer/styles/colors.dart';

class FilterItemContainer extends StatelessWidget {
  final String text;
  final String route;
  FilterItemContainer({this.text, this.route});
  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(

      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors().primaryBlue(),
            spreadRadius: 0.2,
            blurRadius: 2,
          ),
        ],
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Material(
        borderRadius: BorderRadius.circular(5.0),
        // color: _size.white,
        child: InkWell(
          borderRadius: BorderRadius.circular(5.0),
          onTap: () {},
          splashColor: AppColors().inkWellSplash(),
          highlightColor: Colors.white10,
          // splashFactory: InkSplash.splashFactory,
          child: Container(
            padding: EdgeInsets.all(12.0),
            child: Center(
              child: Text(
                text,
                style: GoogleFonts.openSans(
                    fontWeight: FontWeight.w600, fontSize: 17),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
