import 'package:flutter/material.dart';
import 'package:nepek_buyer/pages/products/viewProduct/view_product_state.dart';
import 'package:nepek_buyer/pages/products/viewProduct/widgets/recommended/product_container.dart';
import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/text/normal_text.dart';
import 'package:provider/provider.dart';

class RecommendedProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ViewProductState provider = Provider.of(context);
    final double width = MediaQuery.of(context).size.width;
    return provider.similarProducts.length > 2
        ? Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 15),
            margin: EdgeInsets.only(top: 15),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 10, left: 15),
                  child: Row(
                    children: [
                      NepekText(
                        "Similar Products",
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(width: 5),
                      Icon(
                        Icons.account_circle_outlined,
                        size: 20,
                        color: AppColors.primaryBlue,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Wrap(
                  spacing: width * 0.03,
                  runSpacing: width * 0.03,
                  children: provider.similarProducts
                      .map((product) =>
                          RecommendedProductContainer(product: product))
                      .toList(),
                ),
              ],
            ),
          )
        : SizedBox();
  }
}
