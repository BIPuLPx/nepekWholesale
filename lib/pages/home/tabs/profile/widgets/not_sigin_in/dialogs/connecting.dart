import 'package:flutter/material.dart';

import '../../../../../../../styles/spinkit.dart';

Future<void> connecting(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Signing in',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        content: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              spinkit,
              SizedBox(height: 20),
              Text(
                'Connecting',
                // style: TextStyle(color: appColors['secondaryText']),
              )
            ],
          ),
        ),
      );
    },
  );
}
