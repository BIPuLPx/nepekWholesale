import 'package:flutter/material.dart';

import '../colors.dart';

class NepekIconButton extends StatelessWidget {
  final double size;
  final Function onClick;
  final bool reversed;
  final IconData icon;
  final double iconSize;

  const NepekIconButton(
    this.icon, {
    Key key,
    this.size,
    this.onClick,
    this.reversed,
    this.iconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: reversed == true ? Colors.white : AppColors.officialMatch,
        borderRadius: BorderRadius.circular(100),
        boxShadow: reversed == true
            ? [
                BoxShadow(
                  color: AppColors.officialMatchFourth,
                  spreadRadius: 1,
                  blurRadius: 8,
                  // offset: Offset(0, 2),
                  // offset: Offset(0, 3), // changes position of shadow
                ),
              ]
            : [
                BoxShadow(
                  color: AppColors.officialMatchShadow,
                  spreadRadius: 1,
                  blurRadius: 8,
                  offset: Offset(0, 2), // changes position of shadow
                )
              ],
        border: reversed == true
            ? Border.all(
                color: AppColors.officialMatchThird,
                width: 1.5,
              )
            : Border(),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onClick,
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          splashColor: Colors.transparent,
          highlightColor: Colors.purple.withOpacity(0.2),
          child: Container(
            padding: EdgeInsets.all(size),
            child: Icon(
              icon,
              color: reversed == true ? AppColors.officialMatch : Colors.white,
              size: iconSize == null ? 20 : iconSize,
            ),
          ),
        ),
      ),
    );
  }
}
