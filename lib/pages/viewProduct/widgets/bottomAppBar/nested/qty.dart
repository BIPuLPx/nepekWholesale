import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skite_buyer/pages/viewProduct/widgets/bottomAppBar/nested/qty_selector.dart';

class Qty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "QTY",
          style: GoogleFonts.quicksand(
            fontWeight: FontWeight.w800,
          ),
        ),
        SizedBox(width: 10),
        QtySelector(),
      ],
    );
  }
}
