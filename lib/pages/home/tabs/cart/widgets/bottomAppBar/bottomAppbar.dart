import 'package:flutter/material.dart';
import 'package:skite_buyer/styles/colors.dart';
import 'package:skite_buyer/styles/font_styles.dart';

class CartBottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: SizedBox(
        height: 50,
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(0)),
          ),
          color: AppColors().primaryBlue(),
          onPressed: () {},
          child: Text(
            'Proceed to Checkout',
            style: AppFontStyle().button(Colors.white),
          ),
        ),
      ),
    );
  }
}
