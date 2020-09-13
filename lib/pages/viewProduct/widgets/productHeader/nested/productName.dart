import 'package:flutter/material.dart';
import 'package:skite_buyer/styles/extensions.dart';
import 'package:skite_buyer/styles/font_styles.dart';

class ProductName extends StatelessWidget {
  final String name;
  ProductName({this.name});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5),
      child: Wrap(
        children: [
          Text(
            capitalize(name),
            style: ProductPageFonts().productName(),
          ),
        ],
      ),
    );
  }
}
