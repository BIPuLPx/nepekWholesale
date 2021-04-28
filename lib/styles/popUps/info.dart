import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/styles/colors.dart';

Future<void> infoPopUp(context, String title, String content,
    {Function okFn}) async {
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
            style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
          ),
          actions: [
            TextButton(
              child: Text(
                'Okay',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  color: AppColors.officialMatch,
                ),
              ),
              onPressed: () {
                okFn == null ? Navigator.of(context).pop() : okFn();
              },
            ),
          ],
          content: Text(
            content,
            style: GoogleFonts.poppins(),
          ));
    },
  );
}
