import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/text/normal_text.dart';
import 'package:provider/provider.dart';

import '../../view_product_state.dart';
import 'nested/productName.dart';
import 'nested/product_price.dart';
import 'nested/rating_inside_color.dart';

class ProductHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ViewProductState>(context);
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Container(
          //   margin: EdgeInsets.only(top: 10, bottom: 10),
          //   height: 1,
          //   color: Colors.grey[350],
          // ),
          Text(
            product.productBrand,
            style: GoogleFonts.poppins(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: Colors.grey[500],
            ),
          ),
          ProductName(name: product.productName),
          RatingNo(
              rating: product.productRating, noOfReviews: product.noOfReviews),
          ProductPrice(price: product.productPrice),
          SizedBox(height: 15),
          SoldBy(product: product)
        ],
      ),
    );
  }
}

class SoldBy extends StatelessWidget {
  const SoldBy({
    Key key,
    @required this.product,
  }) : super(key: key);

  final ViewProductState product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.storefront_rounded,
          size: 19,
          color: AppColors.primaryBlue,
        ),
        SizedBox(width: 5),
        NepekText(
          "Sold by:",
          fontSize: 13,
          color: AppColors.primaryBlue,
          fontWeight: FontWeight.w500,
        ),
        SizedBox(width: 10),
        NepekText(
          product.storeName,
          fontSize: 13,
        )
      ],
    );
  }
}
