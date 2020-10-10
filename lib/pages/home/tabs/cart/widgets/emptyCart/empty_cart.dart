import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skite_buyer/styles/colors.dart';

class EmptyCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white,
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SizedBox(height: 110),
          EmptyCartLabel(
            child: 'Your Cart Looks Empty',
            size: 25,
          ),
          EmptyCartLabel(
            child: 'Start shopping and come back ! ',
            size: 20,
          ),
          // SizedBox(height: 50),
          SizedBox(
            height: 420,
            width: 420,
            child: FlareActor(
              "animations/emptycart.flr",
              // alignment: Alignment.topLeft,
              fit: BoxFit.contain,
              animation: "Untitled",
            ),
          )

          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Image.asset(
          //       'images/emptycart.png',
          //       height: 180,
          //       // color: Colors.green,
          //     ),
          //   ],
          // ),
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
      style: GoogleFonts.cabin(
        fontSize: size,
        height: 1.5,
        fontWeight: FontWeight.w800,
        color: AppColors().primaryBlue(),
      ),
    );
  }
}
