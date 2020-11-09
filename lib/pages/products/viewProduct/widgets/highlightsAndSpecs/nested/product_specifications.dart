import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_provider.dart';
import 'package:nepek_buyer/styles/extensions.dart';

import '../../../view_product_state.dart';

class ProductSpecifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ViewProductState>(context);
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: Column(
        children: product.productSpecifications
            .map((spec) => SpecificationsLayout(
                  left: spec['name'],
                  right: spec['value'],
                  index: product.productSpecifications.indexOf(spec),
                ))
            .toList(),
      ),
    );
  }
}

class SpecificationsLayout extends StatelessWidget {
  final String left;
  final String right;
  final int index;
  SpecificationsLayout({this.left, this.right, this.index});
  @override
  Widget build(BuildContext context) {
    final bool darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    final Color odd = darkTheme ? Colors.grey[800] : Colors.grey[350];
    final Color even = darkTheme ? Colors.grey[700] : Colors.grey[200];
    return Container(
      color: index % 2 == 0 ? even : odd,
      padding: EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SpecificationText(text: left),
          SpecificationText(text: right),
        ],
      ),
    );
  }
}

class SpecificationText extends StatelessWidget {
  final String text;
  SpecificationText({this.text});
  @override
  Widget build(BuildContext context) {
    return Text(capitalize(text));
  }
}
