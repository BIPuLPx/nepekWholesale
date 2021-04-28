import 'package:flutter/material.dart';
import 'package:nepek_buyer/pages/products/qnas/qnas_provider.dart';
import 'package:nepek_buyer/pages/products/viewProduct/widgets/productQnas/nested/qna_layout.dart';
import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/text/normal_text.dart';
import 'package:nepek_buyer/styles/text/trimName.dart';
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
        provider.fetchQnas();
      }
    }

    _scrollController.addListener(_onScroll);

    return ListView(
      controller: _scrollController,
      children: <Widget>[
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: AppColors.officialMatch, width: 2))),
                  child: NepekText(
                    'Questions and Answers for \n${trimName(provider.productName, 40)}',
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  )),
            ),
            SizedBox(height: 20),
          ] +
          provider.qnas
              .map<Widget>((qna) => Container(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: QnaLayout(
                      question: {
                        'text': qna['question'],
                        'date': qna['questionedIn'],
                        'name': qna['buyer']
                      },
                      answer: {
                        'text': qna['answer'],
                        'date': qna['answeredIn']
                      },
                      index: provider.qnas.indexOf(qna),
                      length: provider.qnas.length,
                    ),
                  ))
              .toList() +
          [
            provider.nextPage > 1 ? provider.loadingMore : SizedBox(),
          ],
    );
  }
}
