import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skite_buyer/pages/viewProduct/view_product_state.dart';
import 'package:skite_buyer/pages/viewProduct/widgets/productQnas/nested/qna_heading.dart';
import 'package:skite_buyer/pages/viewProduct/widgets/productQnas/nested/qna_layout.dart';

class YesQnAs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ViewProductState>(context);
    return Column(
      children: [
        QnaHeading(
          heading: 'Questions and Answers',
        ),
        Column(
          children: product.productQnas
              .map((qna) => QnaLayout(
                    question: {
                      'text': qna['question'],
                      'date': qna['questionedIn'],
                      'name': product.getBuyerName(qna['buyer_id'])
                    },
                    answer: {'text': qna['answer'], 'date': qna['answeredIn']},
                    index: product.productQnas.indexOf(qna),
                    length: product.productQnas.length,
                  ))
              .toList(),
        ),
      ],
    );
  }
}
