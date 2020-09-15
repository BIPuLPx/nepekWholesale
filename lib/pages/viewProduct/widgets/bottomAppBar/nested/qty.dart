import 'package:flutter/material.dart';
import 'package:skite_buyer/pages/viewProduct/widgets/bottomAppBar/nested/qty_selector.dart';
import 'package:skite_buyer/styles/colors.dart';
import 'package:skite_buyer/styles/font_styles.dart';

class Qty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "QTY",
          style: AppFontStyle().button(AppColors().primaryText()),
        ),
        SizedBox(width: 10),
        QtySelector(),
      ],
    );
  }
}
