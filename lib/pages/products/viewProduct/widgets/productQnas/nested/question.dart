import 'package:flutter/material.dart';

import 'date.dart';
import 'qna_text.dart';
import 'qsn_by.dart';


class Question extends StatelessWidget {
  final String question;
  final String date;
  final String by;
  Question({this.question, this.date, this.by});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QnaText(text: question, insideGraphics: 'Q'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [QsnBy(name: by), Date(date: date)],
        )
      ],
    );
  }
}
