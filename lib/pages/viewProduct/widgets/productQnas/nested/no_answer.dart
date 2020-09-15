import 'package:flutter/material.dart';
import 'package:skite_buyer/pages/viewProduct/widgets/productQnas/nested/qa_graphics.dart';
import 'package:skite_buyer/styles/colors.dart';

class NoAnswer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QAGraphics(text: 'A'),
        Flexible(
          child: Text(
            'Not Answered',
            style: TextStyle(
              color: AppColors().secondaryText(),
            ),
          ),
        ),
      ],
    );
  }
}
