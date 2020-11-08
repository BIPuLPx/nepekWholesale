import 'package:flutter/material.dart';
import 'package:nepek_buyer/pages/viewProduct/widgets/productQnas/nested/date.dart';
import 'package:nepek_buyer/pages/viewProduct/widgets/productQnas/nested/qna_text.dart';
import 'package:nepek_buyer/pages/viewProduct/widgets/productQnas/nested/qsn_by.dart';

class Answer extends StatelessWidget {
  final String answer;
  final String ansDate;
  final String qsnDate;
  Answer({this.answer, this.ansDate, this.qsnDate});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QnaText(text: answer, insideGraphics: 'A'),
        Align(
          alignment: Alignment.bottomRight,
          child: ansDate.split('T')[0] == qsnDate.split('T')[0]
              ? QsnBy(name: 'Answered in same day')
              : Date(date: ansDate),
        )
      ],
    );
  }
}
