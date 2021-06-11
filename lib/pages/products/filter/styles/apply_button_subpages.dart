import 'package:flutter/material.dart';
import 'package:nepek_buyer/styles/colors.dart';

class ApplyButtonSubPages extends StatelessWidget {
  final Function onPressed;
  final Widget child;

  const ApplyButtonSubPages({
    Key key,
    this.onPressed,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: EdgeInsets.all(15),
      child: Container(
        height: 50,
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            backgroundColor: AppColors.officialMatch,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
