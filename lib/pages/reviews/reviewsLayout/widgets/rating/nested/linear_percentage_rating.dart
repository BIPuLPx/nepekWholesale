import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class PercentageRating extends StatelessWidget {
  final String label;
  final Color progressColor;
  final double percent;

  const PercentageRating(
      {Key key, this.label, this.progressColor, this.percent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(top: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          LinearPercentIndicator(
            width: deviceWidth * 0.45,
            lineHeight: 12.0,
            percent: percent,
            backgroundColor: Colors.grey[300],
            progressColor: progressColor,
          ),
          Text(label, style: linearPer(false))
        ],
      ),
    );
  }
}

TextStyle linearPer(bool bold) => GoogleFonts.quicksand(
      fontWeight: bold == true ? FontWeight.bold : FontWeight.normal,
      fontSize: 12,
    );
