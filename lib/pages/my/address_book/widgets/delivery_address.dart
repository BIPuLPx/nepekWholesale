import 'package:flutter/material.dart';
import 'package:nepek_buyer/styles/button/nepek_icon_button.dart';
import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/text/normal_text.dart';

class DeliveryAddress extends StatelessWidget {
  const DeliveryAddress({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: AppColors().officialMatchFourth(),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AppColors().officialMatchFourth(),
            spreadRadius: 1,
            blurRadius: 8,
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            child: NepekIconButton(
              Icons.edit_location_outlined,
              onClick: () {},
              size: 7,
              reversed: true,
            ),
          ),
          Positioned(
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: AppColors().officialMatch(),
              ),
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  NepekText(
                    value: 'Home',
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    color: Colors.white,
                  ),
                  SizedBox(width: 2),
                  Icon(
                    Icons.home_rounded,
                    size: 15,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NepekText(
                value: 'State 3',
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
              SizedBox(height: 5),
              NepekText(value: 'Lalitpur'),
              NepekText(value: 'Lalitpur Outside Ring Road'),
              NepekText(value: 'Lubhu'),
              SizedBox(height: 10),
              NepekText(value: 'Changathali Bus park'),
              SizedBox(height: 10),
              NepekText(value: 'Bipul Raj Humagain'),
              NepekText(value: '9865069507'),
            ],
          ),
        ],
      ),
    );
  }
}
