import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors.dart';

Future<void> yesNoPopUp(dialogContext, String title, var yesFn) async {
  return showDialog<void>(
    context: dialogContext,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Text(
          'Sure ?',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        actions: [
          TextButton(
            child: Text(
              'Yes',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w700,
                color: Colors.red,
              ),
            ),
            onPressed: yesFn,
          ),
          TextButton(
            child: Text(
              'No',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w700,
                color: AppColors.officialMatch,
              ),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
        content: Text(
          title,
          style: GoogleFonts.poppins(),
        ),
      );
    },
  );
}
