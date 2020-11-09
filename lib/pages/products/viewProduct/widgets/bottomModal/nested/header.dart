import 'package:flutter/material.dart';
import 'package:nepek_buyer/pages/products/viewProduct/widgets/bottomModal/nested/product_name.dart';
import 'package:nepek_buyer/pages/products/viewProduct/widgets/bottomModal/nested/product_price.dart';

import 'package:nepek_buyer/styles/extensions.dart';

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
