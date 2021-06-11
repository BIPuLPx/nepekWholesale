import 'package:flutter/material.dart';
import 'package:nepek_buyer/styles/button/nepek_button.dart';
import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/text/normal_text.dart';

class ProductNotAvailable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 55),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          SizedBox(height: 200),
          Image.asset(
            'assets/others/no_orders.png',
            height: 150,
          ),
          SizedBox(height: 30),
          Center(
            child: NepekText(
              'Product not available',
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: AppColors.officialMatch,
            ),
          ),
          SizedBox(height: 10),
          NepekButton(
            label: 'Okay',
            onClick: () => Navigator.pop(context),
          )
        ],
      ),
    );
  }
}
