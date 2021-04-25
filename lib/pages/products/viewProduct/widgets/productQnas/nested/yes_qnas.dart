import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../view_product_state.dart';
import 'qna_heading.dart';
import 'qna_layout.dart';

class YesQnAs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ViewProductState>(context);
    return Column(
      children: [
        QnaHeading(),
        Column(
          children: product.productQnas
              .map((qna) => QnaLayout(
                    question: {
                      'text': qna['question'],
                      'date': qna['questionedIn'],
                      'name': qna['buyer'],
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
