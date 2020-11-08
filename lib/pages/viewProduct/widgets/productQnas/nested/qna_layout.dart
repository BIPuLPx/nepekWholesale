import 'package:flutter/material.dart';
import 'package:nepek_buyer/pages/viewProduct/widgets/productQnas/nested/answer.dart';
import 'package:nepek_buyer/pages/viewProduct/widgets/productQnas/nested/no_answer.dart';
import 'package:nepek_buyer/pages/viewProduct/widgets/productQnas/nested/question.dart';

class QnaLayout extends StatelessWidget {
  final Map question;
  final Map answer;
  final int index;
  final int length;
  QnaLayout({this.question, this.answer, this.index, this.length});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: index == length - 1 ? 20 : 12, top: 5),
      child: Column(
        children: <Widget>[
              Question(
                question: question['text'],
                date: question['date'],
                by: question['name'],
              ),
              SizedBox(height: 15),
              answer['text'] == null
                  ? NoAnswer()
                  : Answer(
                      answer: answer['text'],
                      ansDate: answer['date'],
                      qsnDate: question['date']),
              // Question(question: question['text']),
            ] +
           <Widget> [
              index == length - 1
                  ? Container()
                  : Container(
                      margin: EdgeInsets.only(top: 15, bottom: 5),
                      height: 2,
                      color: Colors.grey[300],
                    )
            ],
      ),
    );
  }
}
