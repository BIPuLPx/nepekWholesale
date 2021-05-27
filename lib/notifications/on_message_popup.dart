import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/styles/colors.dart';

import 'navigate.dart';

Future<void> onMessagePopUp(
    BuildContext context, Map data, String title, String body) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text(
            title,
            style: GoogleFonts.poppins(
              color: AppColors.officialMatch,
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: [
            TextButton(
              child: Text(
                'See',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w700,
                  color: AppColors.officialMatch,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                final _nav = Navigate(context);
                _nav.navigate(data);
              },
            ),
            TextButton(
                child: Text(
                  'Cancel',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700,
                    color: Colors.red,
                  ),
                ),
                onPressed: () => Navigator.of(context).pop()),
            SizedBox(width: 5)
          ],
          content: Text(
            body,
            style: GoogleFonts.poppins(),
          ));
    },
  );
}
