import 'package:flutter/material.dart';
import 'package:skite_buyer/styles/colors.dart';

Future<void> codeExceptions(BuildContext context, String message) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Wrong Code',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        content: SingleChildScrollView(child: Text(message)),
        actions: [
          FlatButton(
            child: Text(
              'Okay',
              style: TextStyle(color: AppColors().primaryBlue()),
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
