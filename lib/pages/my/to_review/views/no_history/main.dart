import 'package:flutter/material.dart';
import 'package:nepek_buyer/styles/empty_data/main.dart';

class NoHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return EmptyData(
      label: 'No review history',
      asset: 'no_reviews',
    );
  }
}
