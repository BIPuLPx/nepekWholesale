import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skite_buyer/styles/colors.dart';

Container body() {
  return Container(
    padding: EdgeInsets.only(top: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.greenAccent[700],
          ),
          child: Icon(
            Icons.done,
            color: Colors.white,
            size: 17,
          ),
        ),
        Text(
          'Sucessfully added to cart',
          style: GoogleFonts.catamaran(
            fontWeight: FontWeight.w500,
            fontSize: 15,
            color: AppColors().secondaryText(),
          ),
        )
      ],
    ),
  );
}
