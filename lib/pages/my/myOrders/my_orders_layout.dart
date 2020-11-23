import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_provider.dart';
import 'package:provider/provider.dart';

import 'my_orders_provider.dart';

class MyOrdersLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MyOrdersProvider provider = Provider.of(context);
    final bool darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    return ListView(
      physics: BouncingScrollPhysics(),
      children: <Widget>[SizedBox(height: 15)] +
          provider.allOrders
              .map<Widget>((order) => Container(
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
                              _leftRightData('Package No', order['package_No']),
                              _leftRightData(
                                  'Bought in', date(order['bought_date'])),
                              _products(order),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ))
              .toList(),
    );
  }

  Column _products(order) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
            SizedBox(height: 10),
            Text('Products', style: _heading())
          ] +
          order['products']
              .map<Widget>((product) => Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: [
                        _leftRightData('Name', product['productName']),
                        _status(product),
                        _statusDates(
                            'Placed Order in', product['placed_order_date']),
                        _statusDates(
                            'Picked by Nepek in', product['pick_order_date']),
                        _statusDates('Delivered in', product['delivered_date']),
                        _statusDates('Cancelled in', product['cancelled_date']),

                        // Date(product['placed_order_date'])
                      ],
                    ),
                  ))
              .toList(),
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
        return Colors.yellow;
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
        padding: EdgeInsets.only(left: 5),
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(color: _statusColor(status['type']), width: 3),
          ),
        ),
        child: _leftRightData('Status', status['status']));
  }

  _statusDates(String type, String ddate) {
    return ddate == null ? Container() : _leftRightData(type, date(ddate));
  }

  Widget _leftRightData(String left, String right) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(left, style: _leftRightStyle(true)),
          Text(right, style: _leftRightStyle(false)),
        ],
      ),
    );
  }

  TextStyle _leftRightStyle(bool gray) => GoogleFonts.poppins(
      color: gray ? Colors.grey : null, fontWeight: FontWeight.w500);
  TextStyle _heading() => GoogleFonts.poppins(fontWeight: FontWeight.w700);
}

String date(date) => DateFormat.yMMMd('en_US').format(DateTime.parse(date));
