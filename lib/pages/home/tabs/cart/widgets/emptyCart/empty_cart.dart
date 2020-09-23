import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skite_buyer/styles/colors.dart';

class EmptyCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 110),
          EmptyCartLabel(
            child: 'Namaste,',
            size: 30,
          ),
          EmptyCartLabel(
            child: 'Your Cart Looks Empty',
            size: 22,
          ),
          EmptyCartLabel(
            child: 'Start shopping and come back ! ',
            size: 18,
          ),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/emptycart.png',
                height: 180,
                // color: Colors.green,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class EmptyCartLabel extends StatelessWidget {
  final String child;
  final double size;
  EmptyCartLabel({this.child, this.size});
  @override
  Widget build(BuildContext context) {
    return Text(
      child,
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w800,
        color: AppColors().primaryBlue(),
      ),
    );
  }
}
