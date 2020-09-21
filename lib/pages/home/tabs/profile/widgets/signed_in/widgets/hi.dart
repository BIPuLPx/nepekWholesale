import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Hi extends StatelessWidget {
  final String name;

  const Hi({Key key, this.name}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 0, top: 30, bottom: 60),
      child: Text(
        'Hey $name !',
        style: hiHeading(30),
      ),
    );
  }
}

TextStyle hiHeading(double size) => GoogleFonts.cabin(
      fontSize: size,
      fontWeight: FontWeight.w600,
    );
