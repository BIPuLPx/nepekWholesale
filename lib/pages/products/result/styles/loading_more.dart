import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/text/normal_text.dart';

class LoadingMore extends StatelessWidget {
  final String value;
  const LoadingMore({
    Key key,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SpinKitRipple(
          color: AppColors().officialMatch(),
          size: 50.0,
        ),
        NepekText(
          value: value,
          color: AppColors().officialMatch(),
          fontWeight: FontWeight.w500,
        )
      ],
    );
  }
}
