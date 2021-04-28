import 'package:flutter/material.dart';
import 'package:nepek_buyer/pages/my/address_book/provider.dart';
import 'package:nepek_buyer/styles/button/nepek_icon_button.dart';
import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/extensions.dart';
import 'package:nepek_buyer/styles/text/normal_text.dart';
import 'package:provider/provider.dart';

class DeliveryAddress extends StatelessWidget {
  final Map add;
  const DeliveryAddress({
    Key key,
    this.add,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AddressBookProvider provider = Provider.of(context);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
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
            bottom: 0,
            right: 0,
            child: NepekIconButton(
              Icons.edit_location_outlined,
              onClick: () => Navigator.pushNamed(
                  context, 'input_delivery_address', arguments: {
                'type': 'edit',
                'refresh': provider.refresh,
                'value': add
              }),
              size: 7,
              reversed: true,
            ),
          ),
          Positioned(
            right: 0,
            child: Row(
              children: [
                provider.defaultDeliveryAddress['_id'] == add['_id']
                    ? Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: AppColors.primaryBlue,
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            NepekText(
                              "Default",
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                              color: Colors.white,
                            ),
                            SizedBox(width: 2),
                            Icon(
                              Icons.done_outline_rounded,
                              size: 15,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      )
                    : SizedBox(),
                SizedBox(width: 10),
                Container(
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
              ],
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
    );
  }
}
