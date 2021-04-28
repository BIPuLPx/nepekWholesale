import 'package:flutter/material.dart';
import 'package:nepek_buyer/styles/network_image.dart';
import 'package:nepek_buyer/styles/text/format_date.dart';
import 'package:nepek_buyer/styles/text/left_right_data.dart';
import 'package:nepek_buyer/styles/text/trimName.dart';

class OrderProduct extends StatelessWidget {
  final Map order;
  const OrderProduct({
    Key key,
    @required this.darkTheme,
    this.order,
  }) : super(key: key);

  final bool darkTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Material(
        color: darkTheme ? Colors.black : Colors.white,
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              'view_order',
              arguments: {'_id': order['_id']},
            );
          },
          child: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                // OrderImage(order: order),
                SizedBox(height: 10),
                leftRightData(
                  'Package No',
                  order['packageNO'],
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(height: 10),
                leftRightData(
                  'Bought in',
                  formatDate(order['bought_date']),
                ),
                SizedBox(height: 3),
                leftRightData(
                  "Product",
                  trimName(order['productName'], 20),
                ),
                SizedBox(height: 3),
                // leftRightData(
                //   "Price",
                //   'NPR ${order['price']}.00',
                // ),
                // SizedBox(height: 3),
                // leftRightData(
                //   "Qty",
                //   '${order['qty']} Nos.',
                // ),
                // SizedBox(height: 3),
                // order['delivery_charge'] != null
                //     ? leftRightData(
                //         "Delivery Charge",
                //         'NPR ${order['delivery_charge']}.',
                //       )
                //     : Container(),
                _status(order),
                // _products(order),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _status(product) {
    Map status;

    if (product['placed_order_date'] == null) {
      status = {'status': 'Pending by Seller', 'type': 0};
    } else if (product['pick_order_date'] == null) {
      status = {'status': 'Placed by Seller', 'type': 1};
    } else if (product['delivered_date'] == null) {
      status = {'status': 'Arriving', 'type': 2};
    } else if (product['cancelled_date'] == null) {
      status = {'status': 'Delivered', 'type': 3};
    } else {
      status = {'status': 'Cancelled', 'type': 4};
    }

    Color _statusColor(int type) {
      if (type == 0)
        return Colors.yellow.shade900;
      else if (type == 1)
        return Colors.teal;
      else if (type == 2)
        return Colors.greenAccent;
      else if (type == 3)
        return Colors.green;
      else
        return Colors.red;
    }

    return Container(
      margin: EdgeInsets.only(top: 10),
      height: 30,
      padding: EdgeInsets.only(left: 5),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(color: _statusColor(status['type']), width: 3),
        ),
      ),
      child: leftRightData(
        'Status',
        status['status'],
        fontSize: 17,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
