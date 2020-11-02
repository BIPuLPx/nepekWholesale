import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoAnswer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Text(
            'Not Answered',
            style: GoogleFonts.quicksand(
              color: Colors.grey,
              // color: AppColors().secondaryText(),
            ),
          ),
        ),
      ],
    );
  }
}
