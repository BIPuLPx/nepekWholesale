import 'package:flutter/material.dart';
import 'package:nepek_buyer/styles/colors.dart';

class NepekButtonIcon extends StatelessWidget {
  final IconData icon;
  final bool reversed;

  const NepekButtonIcon(this.icon, {Key key, this.reversed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: reversed == true ? AppColors().officialMatch() : Colors.white,
      // size: ,
    );
  }
}
