import 'package:flutter/material.dart';
import 'package:nepek_buyer/pages/my/returns/subpages/eliglible_returns/provider.dart';
import 'package:nepek_buyer/pages/my/returns/subpages/eliglible_returns/widgets/reason/main.dart';
import 'package:nepek_buyer/styles/text/format_date.dart';
import 'package:nepek_buyer/styles/text/format_price.dart';
import 'package:nepek_buyer/styles/text/left_right_data.dart';
import 'package:provider/provider.dart';

class EligibleReturnsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final EligibleReturnsProvider provider = Provider.of(context);
    return ListView(
      physics: BouncingScrollPhysics(),
      children: provider.packages
          .map(
            (e) => GestureDetector(
              onTap: () {
                provider.id = e['_id'];
                giveReason(context, provider);
              },
              child: Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(10),
                color: Colors.white,
                child: Column(
                  children: [
                    leftRightData(
                      'Package No',
                      e['packageNO'],
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                    leftRightData(
                      'Product',
                      e['productName'],
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(height: 10),
                    leftRightData(
                      'Price',
                      formatPrice(e['price']),
                    ),
                    leftRightData(
                      'Qty',
                      '${e['qty']} Nos.',
                    ),
                    leftRightData(
                      'Delivered In',
                      formatDate(e['delivered_date']),
                    )
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
