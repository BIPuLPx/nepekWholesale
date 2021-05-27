import 'package:flutter/material.dart';
import 'package:nepek_buyer/styles/network_image.dart';
import 'package:nepek_buyer/styles/text/normal_text.dart';

import 'review_date.dart';
import 'review_stars.dart';
import 'review_text.dart';

class ReviewLayout extends StatelessWidget {
  final Map review;
  final int index;

  ReviewLayout({this.review, this.index});
  @override
  Widget build(BuildContext context) {
    // print(review);
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              review['buyer'] == null
                  ? SizedBox()
                  : NepekText(
                      review['buyer'],
                      color: Colors.grey,
                      fontSize: 13,
                    ),
              ReviewStars(rating: review['rating'].toDouble()),
            ],
          ),
          ReviewImages(review: review),
          ReviewText(
            text: review['review'],
          ),
          ReviewDate(date: review['reviewedIn']),
          // index == length - 1
          //     ? Container()
          //     : Container(
          //         margin: EdgeInsets.only(top: 10),
          //         height: 2,
          //         color: Colors.grey[300],
          //       )
        ],
      ),
    );
  }
}

class ReviewImages extends StatelessWidget {
  const ReviewImages({
    Key key,
    @required this.review,
  }) : super(key: key);

  final Map review;

  @override
  Widget build(BuildContext context) {
    return review['imgs'].length == 0
        ? SizedBox()
        : Container(
            padding: EdgeInsets.all(10),
            child: Wrap(
              spacing: 10,
              children: review['imgs']
                  .map<Widget>(
                    (img) => NepekImageNetwork(
                      url:
                          '${review['imgUrl']}/productReviews/${review['imgKey']}/$img',
                      height: 150,
                      width: 150,
                    ),
                  )
                  .toList(),
            ),
          );
  }
}
