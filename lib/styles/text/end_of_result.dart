import 'package:flutter/material.dart';
import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/text/normal_text.dart';

class EndOfResult extends StatelessWidget {
  final String label;

  const EndOfResult({Key key, this.label}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.only(left: 5, top: 10, bottom: 10),
      child: Center(
        child: NepekText(
          value: label,
          // style: GoogleFonts.poppins(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: AppColors().officialMatch(),
          // ),
        ),
      ),
    );
  }
}
