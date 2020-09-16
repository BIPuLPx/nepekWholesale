import 'package:flutter/material.dart';
import 'package:skite_buyer/styles/colors.dart';
import 'package:skite_buyer/styles/font_styles.dart';

Container footer(context) {
  // final width = MediaQuery.of(context).size.width;
  return Container(
    padding: EdgeInsets.only(top: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 40,
          child: OutlineButton(
            highlightedBorderColor: AppColors().primaryBlue(),
            borderSide:
                BorderSide(color: AppColors().primaryBlue(), width: 1.6),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Continue Shopping',
              style: AppFontStyle().button(
                AppColors().primaryBlue(),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 42,
          child: FlatButton(
            onPressed: () {
              // Navigator.pop(context);
              Navigator.pushReplacementNamed(context, 'cart');
            },
            color: AppColors().primaryBlue(),
            child: Text(
              'Go to Cart',
              style: AppFontStyle().button(Colors.white),
            ),
          ),
        )
      ],
    ),
  );
}
