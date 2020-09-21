import 'package:flutter/material.dart';
import 'package:skite_buyer/styles/spinkit.dart';

Future<void> sendingCode(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Validating',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        content: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              spinkit,
              SizedBox(height: 20),
            ],
          ),
        ),
      );
    },
  );
}
