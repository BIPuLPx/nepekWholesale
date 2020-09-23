import 'package:flutter/material.dart';

class ProductPrice extends StatelessWidget {
  final int price;

  const ProductPrice({Key key, this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('NPR ', style: TextStyle(fontWeight: FontWeight.w800)),
        Text(price.toString()),
      ],
    );
  }
}
