import 'package:flutter/material.dart';
import 'package:skite_buyer/pages/viewProduct/widgets/bottomAppBar/nested/qty.dart';
import 'package:skite_buyer/styles/colors.dart';
import 'package:skite_buyer/styles/font_styles.dart';

class AddToCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Qty(),
        SizedBox(
          width: width * 0.55,
          height: 50,
          child: FlatButton(
            color: AppColors().primaryBlue(),
            onPressed: () {},
            child: Text(
              'Add To Cart',
              style: AppFontStyle().button(Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
