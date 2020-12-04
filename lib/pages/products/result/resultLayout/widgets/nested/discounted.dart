import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/styles/container_with_shadow.dart';

class PerOff extends StatelessWidget {
  final String off;

  const PerOff({Key key, this.off}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ShadowContainer(
      shadowColor: Colors.redAccent,
      blurRadius: 3,
      spreadRadius: 0.02,
      offset: Offset(1, 1),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        color: Colors.redAccent,
        child: Text(
          off,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class OldPrice extends StatelessWidget {
  final int price;
  const OldPrice({Key key, this.price}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'NPR ${price.toString()}.00',
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.lineThrough,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
