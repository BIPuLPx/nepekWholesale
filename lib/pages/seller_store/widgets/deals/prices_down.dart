import 'package:flutter/material.dart';
import 'package:nepek_buyer/styles/font_styles.dart';
import 'prices_down_container.dart';

class Deals extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeFonts().heading('Deals'),
          Center(
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: <Widget>[
                DealsProduct(),
                DealsProduct(),
                DealsProduct(),
                DealsProduct(),
                DealsProduct(),
                DealsProduct(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
