import 'package:flutter/material.dart';
import 'package:nepek_buyer/styles/text/normal_text.dart';

class ReviewText extends StatelessWidget {
  final String text;
  ReviewText({this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: NepekText(
        text,
        fontSize: 14,
      ),
    );
  }
}
