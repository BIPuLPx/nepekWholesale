import 'package:flutter/material.dart';

Future<void> valuesEmptyDialog(context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Not Validated'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Please fill all the data of Product'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Okay'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
