import 'package:flutter/material.dart';
import 'package:skite_buyer/styles/colors.dart';

Future<void> wrongCode(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Wrong Code',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        content: SingleChildScrollView(
            child: Text('The code you entered was wrong')),
        actions: [
          FlatButton(
            child: Text(
              'Try Again',
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
