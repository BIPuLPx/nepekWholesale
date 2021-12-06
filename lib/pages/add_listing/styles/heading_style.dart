import 'package:flutter/material.dart';
import 'package:nepek_buyer/styles/colors.dart';

class Heading extends StatelessWidget {
  final String text;
  Heading({this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 20, left: 5),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 25,
            fontFamily: 'PTSans',
            // color: AppColors
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
