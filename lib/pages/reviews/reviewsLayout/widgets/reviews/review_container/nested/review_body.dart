import 'package:flutter/material.dart';

class Review extends StatelessWidget {
  final String review;
  const Review({Key key, this.review}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 20),
      child: Text(
        review,
        style: TextStyle(
          height: 1.3,
        ),
      ),
    );
  }
}
