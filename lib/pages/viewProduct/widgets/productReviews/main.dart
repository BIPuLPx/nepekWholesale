import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skite_buyer/pages/viewProduct/view_product_state.dart';
import 'package:skite_buyer/pages/viewProduct/widgets/productReviews/nested/review_layout.dart';
import 'package:skite_buyer/pages/viewProduct/widgets/productReviews/nested/reviews_heading.dart';

class ProductReviews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ViewProductState>(context);
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      color: Colors.white,
      padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Heading(heading: 'Reviews'),
          Column(
            children: product.productReviews
                .map((review) => ReviewLayout(
                      review: review['review'],
                      rating: review['rating'],
                      date: review['date'],
                      index: product.productReviews.indexOf(review),
                      length: product.productReviews.length,
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
