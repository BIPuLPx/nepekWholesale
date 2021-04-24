import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget leftRightData(String heading, String data,
    {double fontSize, FontWeight fontWeight}) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(heading, style: _dataStyle(true, fontSize, fontWeight)),
        Flexible(
          child: Container(
            margin: EdgeInsets.only(left: 40),
            child: Text(
              data,
              style: _dataStyle(
                false,
                fontSize,
                fontWeight,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

TextStyle _dataStyle(bool gray, double size, FontWeight fontWeight) =>
    GoogleFonts.poppins(
      fontSize: size == null ? 15 : size,
      fontWeight: fontWeight == null ? FontWeight.normal : fontWeight,
      color: gray ? Colors.grey[600] : null,
    );
