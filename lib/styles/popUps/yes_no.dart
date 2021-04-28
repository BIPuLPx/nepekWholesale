import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/styles/colors.dart';

Future<void> yesNoPopUp(context, String title, String content,
    {Function yesFn, Function noFn, String yes, String no}) async {
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
                yes == null ? 'Okay' : yes,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  color: AppColors.officialMatch,
                ),
              ),
              onPressed: yesFn,
            ),
            TextButton(
              child: Text(
                no == null ? 'No' : no,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  color: Colors.red,
                ),
              ),
              onPressed: noFn,
            ),
            SizedBox(width: 5),
          ],
          content: Text(
            content,
            style: GoogleFonts.poppins(),
          ));
    },
  );
}
