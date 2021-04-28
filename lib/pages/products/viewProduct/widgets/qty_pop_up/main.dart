import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/pages/products/viewProduct/widgets/productOptions/qty.dart';
import 'package:nepek_buyer/styles/colors.dart';

import '../../view_product_state.dart';

Future<void> qtyPop(context, ViewProductState provider) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Text(
          "Select qty",
          style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
        ),
        actions: [
          TextButton(
            child: Text(
              'Cancel',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: Colors.red,
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          TextButton(
            child: Text(
              'Done',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: AppColors.officialMatch,
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
              provider.done(context);
            },
          ),
        ],
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Qty(provider),
          ],
        ),
      );
    },
  );
}
