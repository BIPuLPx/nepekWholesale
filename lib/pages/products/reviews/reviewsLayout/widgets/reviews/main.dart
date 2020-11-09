import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nepek_buyer/pages/reviews/reviewsLayout/widgets/reviews/review_container/main.dart';
import 'package:nepek_buyer/pages/reviews/reviews_provider.dart';

class Reviews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final reviews = Provider.of<ReviewsState>(context);
    return Column(
      children: reviews.reviews
          .map((review) => ReviewsContainer(
                name: reviews.getName(review['customer_uid']),
                rating: review['rating'].toDouble(),
                review: review['review'],
                date: review['date'],
              ))
          .toList(),
    );
  }
}
