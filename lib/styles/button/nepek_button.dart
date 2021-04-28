import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/styles/text/normal_text.dart';
import '../colors.dart';

class NepekButton extends StatelessWidget {
  final double padding;
  final Color backgroundColor;
  final Color textColor;
  final String label;
  final bool reverse;
  final Function onClick;
  final double width;
  final Widget icon;
  final bool iconReverse;
  final double fontSize;
  final double height;
  const NepekButton({
    Key key,
    this.label,
    this.reverse,
    this.onClick,
    this.backgroundColor,
    this.textColor,
    this.padding,
    this.width,
    this.icon,
    this.iconReverse,
    this.fontSize,
    this.height,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? width,
      height: height == null ? 50 : height,
      decoration: backgroundColor == null
          ? reverse == true
              ? BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.officialMatchFourth,
                      spreadRadius: 1,
                      blurRadius: 8,
                      // offset: Offset(0, 2),
                    ),
                  ],
                  border: Border.all(
                    color: AppColors.officialMatchThird,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(10),
                )
              : BoxDecoration(
                  color: AppColors.officialMatch,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.officialMatchShadow,
                      spreadRadius: 1,
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    )
                  ],
                  borderRadius: BorderRadius.circular(10),
                )
          : BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: backgroundColor.withOpacity(0.6),
                  spreadRadius: 1,
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
              borderRadius: BorderRadius.circular(10),
            ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onClick,
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          splashColor: Colors.transparent,
          highlightColor: Colors.purple.withOpacity(0.2),
          child: Container(
            padding: EdgeInsets.all(padding == null ? 10 : padding),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: icon != null
                  ? iconReverse == null
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            icon,
                            SizedBox(width: 10),
                            buttonLabel(fontSize),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buttonLabel(fontSize),
                            SizedBox(width: 10),
                            icon,
                          ],
                        )
                  : buttonLabel(fontSize),
            ),
          ),
        ),
      ),
    );
  }

  NepekText buttonLabel(double fontSize) {
    return NepekText(
      label,
      fontSize: fontSize == null ? 15 : fontSize,
      color: textColor == null
          ? reverse == true
              ? AppColors.officialMatch
              : Colors.white
          : textColor,
      fontWeight: FontWeight.w600,
    );
  }
}
