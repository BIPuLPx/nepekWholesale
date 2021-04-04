import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'nested/shop_by_category_container.dart';
import 'package:random_color/random_color.dart';

RandomColor _randomColor = RandomColor();

class GridSubCategories extends StatelessWidget {
  final String heading;
  final Color backgroundColor;
  final ColorHue textColor;

  const GridSubCategories(
      {Key key, this.heading, this.backgroundColor, this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = _randomColor.randomColor(
      colorHue: textColor,
      colorBrightness: ColorBrightness.dark,
    );
    return Container(
      padding: EdgeInsets.only(bottom: 15),
      color: backgroundColor,
      // decoration: new BoxDecoration(
      //   image: DecorationImage(
      //     image: NetworkImage(backGroundImage),
      //     fit: BoxFit.fill,
      //   ),
      // ),
      // margin: EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _heading(heading, textColor, color),
          Center(
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                CategoryCollectionsContainer(
                  label: 'Face Masks',
                  borderColor: color,
                ),
                CategoryCollectionsContainer(
                  label: 'Face Masks',
                  borderColor: color,
                ),
                CategoryCollectionsContainer(
                  label: 'Face Masks',
                  borderColor: color,
                ),
                CategoryCollectionsContainer(
                  label: 'Face Masks',
                  borderColor: color,
                ),
                CategoryCollectionsContainer(
                  label: 'Face Masks',
                  borderColor: color,
                ),
                CategoryCollectionsContainer(
                  label: 'Face Masks',
                  borderColor: color,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _heading(String text, ColorHue textColor, Color color) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(bottom: 15, left: 10, top: 10),
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: color,
              spreadRadius: 1,
              offset: Offset(4, 4),
            ),
          ],
          // borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          text,
          style: GoogleFonts.poppins(
            color: color,
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
