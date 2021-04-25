import 'package:flutter/material.dart';
import 'package:nepek_buyer/styles/extensions.dart';

import 'product_name.dart';
import 'product_price.dart';

Row header(String productName, String productPrice) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Flexible(
        child: ProductName(
          name: capitalize(productName),
        ),
      ),
      ProductPrice(price: productPrice)
    ],
  );
}
