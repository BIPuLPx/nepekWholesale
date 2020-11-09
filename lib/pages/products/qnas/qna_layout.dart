import 'package:flutter/material.dart';
import 'package:nepek_buyer/pages/products/qnas/qnas_provider.dart';
import 'package:nepek_buyer/pages/products/viewProduct/widgets/productQnas/nested/qna_layout.dart';
import 'package:provider/provider.dart';


class Qnas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<QnasProvider>(context);
    ScrollController _scrollController = new ScrollController();

    void _onScroll() {
      final _scrollThreshold = 20;
      final maxScroll = _scrollController.position.maxScrollExtent;
      final currentScroll = _scrollController.position.pixels;
      if (maxScroll - currentScroll <= _scrollThreshold) {
        // print("here");
        _scrollController.removeListener(_onScroll);
        provider.fetchReviews(provider.nextPage);
      }
    }

    _scrollController.addListener(_onScroll);

    return ListView(
      controller: _scrollController,
      physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      children: <Widget>[SizedBox(height: 15)] +
          provider.qnas
              .map<Widget>((qna) => QnaLayout(
                    question: {
                      'text': qna['question'],
                      'date': qna['questionedIn'],
                      'name': provider.getName(qna['buyer_id'])
                    },
                    answer: {'text': qna['answer'], 'date': qna['answeredIn']},
                    index: provider.qnas.indexOf(qna),
                    length: provider.qnas.length,
                  ))
              .toList() +
          [
            provider.loadingMore,
          ],
    );
  }
}
