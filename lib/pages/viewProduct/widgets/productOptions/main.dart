import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skite_buyer/pages/viewProduct/view_product_state.dart';
import 'package:skite_buyer/pages/viewProduct/widgets/productOptions/nested/select_options.dart';

class ProductOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ViewProductState>(context);
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(left: 15, right: 15, bottom: 10),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: product.productOptions
            .map((option) => SelectOptions(
                  title: option['name'],
                  options: option['value'],
                  defaultOption: option['default'],
                  changeOption: product.changeOption,
                ))
            .toList(),
      ),
    );
  }
}
