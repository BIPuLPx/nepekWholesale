import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skite_buyer/pages/viewProduct/view_product_state.dart';
import 'package:skite_buyer/pages/viewProduct/widgets/productHeader/nested/productName.dart';
import 'package:skite_buyer/pages/viewProduct/widgets/productHeader/nested/product_price.dart';
import 'package:skite_buyer/pages/viewProduct/widgets/productHeader/nested/rating_inside_color.dart';

class ProductHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ViewProductState>(context);
    return Card(
      child: Container(
        // color: Colors.white,
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
              style: GoogleFonts.cabin(
                fontSize: 13,
                // color: Colors.grey[600],
              ),
            ),
            ProductName(name: product.productName),
            RatingNo(
                rating: product.productRating,
                noOfReviews: product.noOfReviews),
            ProductPrice(price: product.productPrice),
          ],
        ),
      ),
    );
  }
}
