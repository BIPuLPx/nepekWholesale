import 'package:flutter/material.dart';
import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/extensions.dart';
import 'package:nepek_buyer/styles/text/normal_text.dart';

class DeliveryAddressDefault extends StatelessWidget {
  final Map add;
  const DeliveryAddressDefault({
    Key key,
    this.add,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(top: 12),
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
                    value: capitalize(add['home_office']),
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    color: Colors.white,
                  ),
                  SizedBox(width: 2),
                  Icon(
                    add['home_office'] == 'home'
                        ? Icons.home_rounded
                        : Icons.work_rounded,
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
                value: add['state'],
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
              SizedBox(height: 5),
              NepekText(value: add['district']),
              NepekText(value: add['city']),
              NepekText(value: add['area']),
              SizedBox(height: 10),
              NepekText(value: add['address']),
              SizedBox(height: 10),
              NepekText(value: add['name']),
              NepekText(value: add['phone'].toString()),
            ],
          ),
        ],
      ),
    );
  }
}
