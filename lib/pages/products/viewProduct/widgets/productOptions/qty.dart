import 'package:flutter/material.dart';
import 'package:nepek_buyer/pages/products/viewProduct/view_product_state.dart';
import 'package:nepek_buyer/pages/products/viewProduct/widgets/productOptions/qty_selector.dart';
import 'package:nepek_buyer/styles/text/normal_text.dart';

class Qty extends StatelessWidget {
  final ViewProductState provider;

  const Qty(this.provider);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NepekText(
          "Quantity",
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: Colors.grey,

          // fontWeight: FontWeight.w700,
        ),
        SizedBox(height: 10),
        QtySelector(provider),
      ],
    );
  }
}
