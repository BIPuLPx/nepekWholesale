import 'package:flutter/material.dart';
import 'package:nepek_buyer/styles/empty_data/main.dart';

class NoEligibleReturns extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return EmptyData(
      asset: 'no_returns',
      label: 'No Eligible Returns',
    );
  }
}
