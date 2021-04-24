import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/styles/colors.dart';

Future<void> errorPopup(context, String title) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
          title: Text(
            'Error',
            style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
          ),
          actions: [
            TextButton(
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
          content: Text(
            title,
            style: GoogleFonts.poppins(),
          ));
    },
  );
}
