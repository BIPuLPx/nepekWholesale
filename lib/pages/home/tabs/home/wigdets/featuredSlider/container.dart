import 'package:flutter/material.dart';
import 'package:skite_buyer/styles/colors.dart';

class BrandsContainer extends StatelessWidget {
  final args;
  final String text;

  const BrandsContainer({Key key, this.text, this.args}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'featured_brand_landing', arguments: args);
      },
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: AppColors().primaryYellow(),
          borderRadius: BorderRadius.circular(15),
        ),
        margin: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
        height: 100,
        width: 150,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors().primaryBlue(),
              letterSpacing: 1.1,
            ),
          ),
        ),
      ),
    );
  }
}
