import 'package:flutter/material.dart';

import 'nested/body.dart';
import 'nested/footer.dart';
import 'nested/header.dart';


addToCart(context, productName, price) {
  showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
      builder: (context) {
        return Container(
          padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              header(productName, price),
              body(),
              footer(context),
            ],
          ),
        );
      });
}
