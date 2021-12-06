import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/styles/appBars/default_app_bar.dart';
import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/popUps/yes_no.dart';
import 'package:nepek_buyer/styles/toasts/error_toast.dart';

customAppBar(context, title) {
  return defaultAppBar(context, title, false);
}

cancelAppBar(BuildContext context, String label) {
  return AppBar(
    centerTitle: true,
    elevation: 0,
    leading: IconButton(
      icon: Icon(
        Icons.close_rounded,
        size: 28,
        color: AppColors.officialMatch,
      ),
      onPressed: () {
        yesFn() {
          showErrorToast(context, 'Product Cancelled');
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        }

        yesNoPopUp(
          context,
          'Do you sure want  to cancel product registration ?',
          yesFn,
        );
      },
    ),
    title: Text(
      label,
      style: GoogleFonts.poppins(
        fontWeight: FontWeight.w600,
        fontSize: 20,
        color: AppColors.officialMatch,
      ),
    ),
  );
}
