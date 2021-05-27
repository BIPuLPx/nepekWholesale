import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:nepek_buyer/pages/products/give_review/layout/add_image/main.dart';
import 'package:nepek_buyer/pages/products/give_review/provider.dart';
import 'package:nepek_buyer/styles/button/nepek_button.dart';
import 'package:nepek_buyer/styles/network_image.dart';
import 'package:nepek_buyer/styles/text/format_date.dart';
import 'package:nepek_buyer/styles/text/left_right_data.dart';
import 'package:nepek_buyer/styles/text/nepek_text_input.dart';
import 'package:nepek_buyer/styles/text/normal_text.dart';
import 'package:nepek_buyer/styles/text/trimName.dart';
import 'package:provider/provider.dart';

class GiveReviewLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GiveReviewProvider provider = Provider.of(context);
    final GiveReviewProvider imageProvider = Provider.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Header(),
            SizedBox(height: 60),
            NepekText(
              'Give a rating',
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: 5),
            ReviewStars(),
            SizedBox(height: 20),
            NepekTextInput(
              minlines: 3,
              maxlines: 5,
              labelText: 'Write a review',
              hint: 'Give experience . . . . . .',
              onChanged: (val) => provider.review = val,
            ),
            SizedBox(height: 20),
            !provider.isaddImage
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      NepekText(
                        'Add Images if you want',
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(height: 8),
                      NepekButton(
                        label: 'Add Images',
                        onClick: () => provider.addReviewImage(),
                      ),
                    ],
                  )
                : AddImage(),
          ],
        ),
      ),
      floatingActionButton: NepekButton(
        width: MediaQuery.of(context).size.width * 0.4,
        label: 'Add Review',
        onClick: () => provider.addReview(context, imageProvider.imagePaths),
      ),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GiveReviewProvider provider = Provider.of(context);
    final product = provider.product;
    return Column(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: GestureDetector(
            onTap: () => Navigator.pushNamed(
              context,
              'view_product',
              arguments: {
                'product_id': product['productID'],
              },
            ),
            child: NepekImageNetwork(
              url: product['img'],
              height: 100,
              width: 100,
            ),
          ),
        ),
        SizedBox(height: 20),
        leftRightData(
          'Product',
          trimName(product['productName'], 20),
          fontSize: 17,
        ),
        leftRightData(
          'Delivered In',
          formatDate(product['delivered_date']),
          fontSize: 17,
        ),
      ],
    );
  }
}

class ReviewStars extends StatelessWidget {
  final double rating;
  ReviewStars({this.rating});
  @override
  Widget build(BuildContext context) {
    final GiveReviewProvider provider = Provider.of(context);

    return RatingBar(
      ignoreGestures: false,
      initialRating: 1,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: false,
      itemCount: 5,
      itemSize: 25,
      itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
      ratingWidget: RatingWidget(
        full: Icon(
          Icons.star,
          color: Colors.amber,
        ),
        empty: Icon(
          Icons.star,
          color: Colors.grey,
        ),
        half: Icon(
          Icons.star,
          color: Colors.amber,
          size: 30,
        ),
      ),
      onRatingUpdate: (rating) {
        provider.rating = rating.round();
      },
    );
  }
}
