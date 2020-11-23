import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/styles/colors.dart';

class Hi extends StatelessWidget {
  final String name;

  const Hi({Key key, this.name}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors().officialMatch(),
      padding: EdgeInsets.only(left: 60, right: 30, top: 60, bottom: 60),
      child: Text(
        'Hey $name !',
        style: hiHeading(60),
      ),
    );
  }
}

TextStyle hiHeading(double size) => GoogleFonts.poppins(
      fontSize: size,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    );
