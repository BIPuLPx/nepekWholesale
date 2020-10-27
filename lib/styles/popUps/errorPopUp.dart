import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skite_buyer/styles/colors.dart';

Future<void> errorPopup(context, String title) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
          title: Text(
            'Error',
            style: GoogleFonts.nunitoSans(fontWeight: FontWeight.w800),
          ),
          actions: [
            TextButton(
              child: Text(
                'Ok',
                style: GoogleFonts.nunitoSans(
                  fontWeight: FontWeight.w800,
                  color: AppColors().primaryBlue(),
                ),
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
          content: Text(
            title,
            style: GoogleFonts.cabinCondensed(),
          ));
    },
  );
}
