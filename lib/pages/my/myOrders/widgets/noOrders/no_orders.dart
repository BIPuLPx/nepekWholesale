import 'package:flutter/material.dart';
import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/text/normal_text.dart';

class NoOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          SizedBox(height: 200),
          Image.asset(
            'assets/others/no_orders.png',
            height: 150,
          ),
          SizedBox(height: 30),
          NepekText(
            'No Orders',
            fontSize: 25,
            fontWeight: FontWeight.w500,
            color: AppColors.officialMatch,
          ),
        ],
      ),
    );
  }
}
