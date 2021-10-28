import 'package:flutter/material.dart';
import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/extensions.dart';
import 'package:nepek_buyer/styles/text/normal_text.dart';

class DeliveryAddressDefaultOrder extends StatelessWidget {
  final Map add;
  const DeliveryAddressDefaultOrder({
    Key key,
    this.add,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.only(left: 15),
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(color: AppColors.officialMatch, width: 2),
            ),
          ),
          child: NepekText(
            'Your packages will be delivered to',
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 10),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(top: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: AppColors.officialMatchFourth,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: AppColors.officialMatchFourth,
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
                    color: AppColors.officialMatch,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      NepekText(
                        capitalize(add['home_office']),
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
                    add['state'],
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                  SizedBox(height: 5),
                  NepekText(add['district']),
                  NepekText(add['city']),
                  NepekText(add['area']),
                  SizedBox(height: 10),
                  NepekText(add['address']),
                  SizedBox(height: 10),
                  NepekText(add['name']),
                  NepekText(add['phone'].toString()),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 15),
        Row(
          children: [
            Icon(
              Icons.directions_bus_outlined,
              color: AppColors.primaryBlue,
              size: 21,
            ),
            SizedBox(width: 5),
            NepekText(
              'Estimated Delivery time',
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(width: 10),
            NepekText(
              '3 - 6 days',
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600],
            ),
          ],
        ),
        SizedBox(height: 15),
      ],
    );
  }
}
