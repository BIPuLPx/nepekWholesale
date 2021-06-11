import 'package:flutter/material.dart';
import 'package:nepek_buyer/pages/my/to_review/provider.dart';
import 'package:nepek_buyer/styles/button/nepek_button.dart';
import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/empty_data/main.dart';
import 'package:nepek_buyer/styles/text/normal_text.dart';
import 'package:provider/provider.dart';

class NoReviews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ToReviewProvider provider = Provider.of(context);
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(10),
            child: NepekButton(
              label: "History",
              onClick: () => provider.history(),
            ),
          ),
          SizedBox(height: 50),
          EmptyData(
            label: 'No Products to review',
            asset: 'no_reviews',
          ),
        ],
      ),
    );
  }
}
