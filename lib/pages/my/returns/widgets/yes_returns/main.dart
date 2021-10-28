import 'package:flutter/material.dart';
import 'package:nepek_buyer/pages/my/returns/provider.dart';
import 'package:nepek_buyer/styles/text/format_date.dart';
import 'package:nepek_buyer/styles/text/format_price.dart';
import 'package:nepek_buyer/styles/text/left_right_data.dart';
import 'package:nepek_buyer/styles/text/trimName.dart';
import 'package:provider/provider.dart';

class YesReturns extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ReturnsProvider provider = Provider.of(context);
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        ...provider.packages.map(
          (e) => Container(
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
                  trimName(e['productName'], 20),
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(height: 10),
                // leftRightData('Price', formatPrice(e['price'])),
                leftRightData('Qty', '${e['qty']} Nos.'),
                leftRightData('Returned In', formatDate(e['returned_date'])),
                leftRightData('Reason', e['return_reason'])
              ],
            ),
          ),
        ),
        SizedBox(height: 100),
      ],
    );
  }
}

// "_id": "608d0934e88fe384bb3f6265",
//     "productID": "608cf793c7aa3e64b5fa6abf",
//     "price": 100000,
//     "qty": 1,
//     "return_reason": "Damaged / Broken",
//     "returned_date": "2021-05-03T08:31:16.777Z",
//     "productName": "Iphone 13 pro max"
