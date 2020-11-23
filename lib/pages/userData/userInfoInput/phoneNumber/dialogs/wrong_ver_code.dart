import 'package:flutter/material.dart';
import 'package:nepek_buyer/styles/colors.dart';

Future<void> codeExceptions(BuildContext context, String message) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Wrong Code',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        content: SingleChildScrollView(child: Text(message)),
        actions: [
          FlatButton(
            child: Text(
              'Okay',
              style: TextStyle(color: AppColors().officialMatch()),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
