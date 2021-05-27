import 'package:flutter/material.dart';

class SellerType extends StatelessWidget {
  final int type;
  const SellerType({
    Key key,
    this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (type == -1)
      return Container(
        padding: EdgeInsets.all(3),
        color: Colors.white,
        child: Image.asset(
          'assets/others/nepek_sell.png',
          height: 12,
        ),
      );
    else if (type == 1)
      return Container(
        padding: EdgeInsets.all(3),
        color: Colors.white,
        child: Image.asset(
          'assets/others/elite_sell.png',
          height: 12,
        ),
      );
    else
      return SizedBox();
  }
}
