import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/extensions.dart';

class Category extends StatelessWidget {
  final Function onPressed;
  final String label;
  final String assetLocation;
  final double imageHeight;

  const Category({
    Key key,
    this.onPressed,
    this.label,
    this.assetLocation,
    this.imageHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: AppColors.officialMatchFourth,
              blurRadius: 1,
            )
          ]),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            padding: EdgeInsets.all(10),
            height: deviceWidth * 0.3,
            width: deviceWidth * 0.3,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  assetLocation,
                  height:
                      imageHeight == null ? deviceHeight * 0.06 : imageHeight,
                ),
                Center(
                  child: Text(
                    capitalize(label),
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      height: 1.25,
                      fontWeight: FontWeight.w500,
                      fontSize: 13.7,
                      // color: AppColors().officialMatch(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
