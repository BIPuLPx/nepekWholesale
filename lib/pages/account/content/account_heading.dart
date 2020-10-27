import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountHeading extends StatelessWidget {
  final String heading;

  const AccountHeading({Key key, this.heading}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        heading,
        style: accountHeadingStyle(),
      ),
    );
  }
}

TextStyle accountHeadingStyle() =>
    GoogleFonts.nunitoSans(fontSize: 22, fontWeight: FontWeight.w700);
