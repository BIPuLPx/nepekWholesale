import 'package:flutter/material.dart';

class ShadowContainer extends StatelessWidget {
  final Widget child;
  final Color shadowColor;
  final double spreadRadius;
  final double blurRadius;
  final Offset offset;

  const ShadowContainer(
      {Key key,
      this.child,
      this.shadowColor,
      this.spreadRadius,
      this.blurRadius,
      this.offset})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.only(
        //   topLeft: Radius.circular(10),
        //   topRight: Radius.circular(10),
        //   bottomLeft: Radius.circular(10),
        //   bottomRight: Radius.circular(10),
        // ),
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            spreadRadius: spreadRadius,
            blurRadius: blurRadius,
            offset: offset ?? Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
    );
  }
}
