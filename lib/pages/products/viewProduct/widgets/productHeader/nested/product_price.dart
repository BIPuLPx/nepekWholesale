import 'package:flutter/material.dart';
import 'package:nepek_buyer/styles/text/format_price.dart';
import 'package:nepek_buyer/styles/text/normal_text.dart';

class ProductPrice extends StatelessWidget {
  final String price;
  ProductPrice({this.price});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: NepekText(
        formatPrice(price),
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
