import 'package:flutter/material.dart';
import 'package:skite_buyer/styles/font_styles.dart';

class ProductPrice extends StatelessWidget {
  final String price;
  ProductPrice({this.price});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text(
            'NPR  ',
            style: ProductPageFonts().productPrice(FontWeight.w700),
          ),
          Text(
            '$price.00',
            style: ProductPageFonts().productPrice(FontWeight.w600),
          )
        ],
      ),
    );
  }
}
