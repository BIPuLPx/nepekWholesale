import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../reviews_provider.dart';
import 'widgets/rating/main.dart';
import 'widgets/reviews/main.dart';

class ReviewsLayout extends StatefulWidget {
  @override
  _ReviewsLayoutState createState() => _ReviewsLayoutState();
}

class _ReviewsLayoutState extends State<ReviewsLayout> {
  ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    final review = Provider.of<ReviewsState>(context);

    void _onScroll() {
      final _scrollThreshold = 20;
      final maxScroll = _scrollController.position.maxScrollExtent;
      final currentScroll = _scrollController.position.pixels;
      if (maxScroll - currentScroll <= _scrollThreshold) {
        _scrollController.removeListener(_onScroll);
        review.fetchReviews();
      }
    }

    _scrollController.addListener(_onScroll);

    return Container(
      // padding: EdgeInsets.only(left: 15, right: 15),
      color: Colors.grey[200],
      child: ListView(
        controller: _scrollController,
        physics: BouncingScrollPhysics(),
        children: [
          RatingCount(),
          Reviews(),
          review.loadingMore,
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
