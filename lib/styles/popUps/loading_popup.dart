import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../spinkit.dart';

Future<void> loadingPopUP(context, String title) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        content: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              spinkit,
              SizedBox(height: 20),
              Text(
                title,
                style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
      );
    },
  );
}
