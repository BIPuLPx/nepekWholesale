import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'nested/shop_by_category_container.dart';
import 'package:random_color/random_color.dart';

RandomColor _randomColor = RandomColor();

class GridSubCategories extends StatelessWidget {
  final String heading;
  final ColorHue textColor;
  final List data;

  const GridSubCategories({
    Key key,
    this.heading,
    this.textColor,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final backgroundColor = _randomColor.randomColor(
      colorSaturation: ColorSaturation.lowSaturation,
      colorBrightness: ColorBrightness.veryLight,
    );

    Color color = _randomColor.randomColor(
      // colorHue: ColorHue.blue,
      colorBrightness: ColorBrightness.dark,
      colorSaturation: ColorSaturation.lowSaturation,
    );
    return Container(
      padding: EdgeInsets.only(bottom: 15, top: 5),
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _heading(heading, textColor, color),
          Center(
            child: Wrap(
              spacing: 15,
              runSpacing: 15,
              children: data
                  .map((e) => CategoryCollectionsContainer(data: e))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _heading(String text, ColorHue textColor, Color color) {
    return Container(
      margin: EdgeInsets.only(bottom: 15, left: 15, top: 10),
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: color,
            spreadRadius: 1,
            offset: Offset(3, 3),
          ),
        ],
      ),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          color: color,
          fontWeight: FontWeight.w700,
          fontSize: 16,
        ),
      ),
    );
  }
}
