import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Container body() {
  return Container(
    padding: EdgeInsets.only(top: 30),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.greenAccent[700],
          ),
          child: Icon(
            Icons.done,
            color: Colors.white,
            size: 13,
          ),
        ),
        Text(
          'Sucessfully added to cart',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            fontSize: 13,
            // color: AppColors().secondaryText(),
          ),
        )
      ],
    ),
  );
}
