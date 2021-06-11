import 'package:flutter/material.dart';
import 'package:nepek_buyer/styles/empty_data/main.dart';

class NoReturns extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return EmptyData(
      asset: 'no_returns',
      label: 'No Returns',
      hideOK: true,
    );
  }
}
