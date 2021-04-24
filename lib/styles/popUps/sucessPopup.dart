import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/styles/colors.dart';

Future<void> sucessFulPopup(context, String title) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Sucessful',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w700),
        ),
        actions: [
          FlatButton(
            child: Text(
              'Okay',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: AppColors().officialMatch(),
              ),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(height: 20),
            Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Icon(
                  Icons.done,
                  size: 30,
                  color: Colors.white,
                )),
            SizedBox(height: 20),
            Text(
              title,
              style: GoogleFonts.poppins(),
            )
          ],
        ),
      );
    },
  );
}
