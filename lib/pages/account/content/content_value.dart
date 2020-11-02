import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountContentValue extends StatelessWidget {
  final String value;

  const AccountContentValue({Key key, this.value}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15),
      child: Text(value, style: accContentValStyle()),
    );
  }
}

TextStyle accContentValStyle() => GoogleFonts.quicksand(height: 1.5);
