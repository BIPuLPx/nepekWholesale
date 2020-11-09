import 'package:flutter/material.dart';
import 'package:nepek_buyer/pages/products/viewProduct/styles/heading.dart';

import 'nested/product_highlights.dart';
import 'nested/product_specifications.dart';

class HighLightsAndSpecs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        // color: Colors.white,
        padding: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            heading('Highlights'),
            SizedBox(height: 15),
            ProductHighlights(),
            SizedBox(height: 20),
            heading('Specifications'),
            SizedBox(height: 15),
            ProductSpecifications()
          ],
        ),
      ),
    );
  }
}