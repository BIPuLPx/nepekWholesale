import 'package:flutter/material.dart';
import 'package:nepek_buyer/pages/my/to_review/provider.dart';
import 'package:nepek_buyer/pages/products/viewProduct/widgets/productReviews/nested/review_layout.dart';
import 'package:nepek_buyer/styles/network_image.dart';
import 'package:nepek_buyer/styles/text/format_date.dart';
import 'package:nepek_buyer/styles/text/left_right_data.dart';
import 'package:nepek_buyer/styles/text/trimName.dart';
import 'package:provider/provider.dart';

class YesHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ToReviewProvider provider = Provider.of(context);
    return ListView(
      children: provider.toReview
          .map((e) => SingleToReview(provider: provider, e: e))
          .toList(),
    );
  }
}

class SingleToReview extends StatelessWidget {
  final e;
  const SingleToReview({
    Key key,
    @required this.provider,
    this.e,
  }) : super(key: key);

  final ToReviewProvider provider;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, 'view_product', arguments: {
        'product_id': e['productID'],
      }),
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: NepekImageNetwork(
                url: e['img'],
                height: 100,
              ),
            ),
            SizedBox(height: 20),
            leftRightData(
              'Product',
              trimName(e['productName'], 20),
            ),
            leftRightData(
              'Delivered In',
              formatDate(e['delivered_date']),
            ),
            Container(
              padding: EdgeInsets.only(top: 10, left: 10, right: 10),
              child: ReviewLayout(
                review: e['review'],
              ),
            )
          ],
        ),
      ),
    );
  }
}
