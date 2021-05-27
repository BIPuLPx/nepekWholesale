import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:random_color/random_color.dart';

import 'widgets/grid_container.dart';

class ProductCollection extends StatelessWidget {
  final String heading;
  final List data;
  const ProductCollection({Key key, this.heading, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    RandomColor _randomColor = RandomColor();
    Color _color = _randomColor.randomColor(
      colorHue: ColorHue.blue,
      colorSaturation: ColorSaturation.lowSaturation,
      colorBrightness: ColorBrightness.light,
    );
    return Container(
      padding: EdgeInsets.only(bottom: 15),
      margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
      decoration: BoxDecoration(
        color: _color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _heading(heading, _color),
          Center(
            child: Wrap(
              spacing: 15,
              runSpacing: 15,
              children: data
                  .map(
                    (e) => GridContainer(data: e),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _heading(String text, Color _color) => Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        margin: EdgeInsets.only(bottom: 15, left: 14, top: 15),
        child: Text(
          text,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
      );
}
