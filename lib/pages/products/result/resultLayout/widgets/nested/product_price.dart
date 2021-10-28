import 'package:flutter/material.dart';
import 'package:nepek_buyer/styles/text/format_price.dart';
import 'package:nepek_buyer/styles/text/normal_text.dart';

class ProductPrice extends StatelessWidget {
  final int price;

  const ProductPrice({Key key, this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        NepekText(
          formatPrice(price),
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ],
    );
  }
}
