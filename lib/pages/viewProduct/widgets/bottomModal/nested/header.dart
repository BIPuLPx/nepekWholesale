import 'package:flutter/material.dart';
import 'package:skite_buyer/pages/viewProduct/widgets/bottomModal/nested/product_name.dart';
import 'package:skite_buyer/pages/viewProduct/widgets/bottomModal/nested/product_price.dart';
import 'package:skite_buyer/styles/extensions.dart';

Row header(String productName, String productPrice) {
  return Row(
    children: [
      Flexible(
        child: ProductName(
          name: capitalize(productName),
        ),
      ),
      SizedBox(width: 15),
      ProductPrice(price: productPrice)
    ],
  );
}
