import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/styles/text/normal_text.dart';

class NoAnswer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Container(
            child: NepekText(
              'Not Answered',
              fontSize: 14,
              color: Colors.grey[400],
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
