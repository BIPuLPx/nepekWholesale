import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:nepek_buyer/savedData/apis.dart';
import 'package:nepek_buyer/savedData/user_data.dart';
import 'package:nepek_buyer/styles/appBars/default_app_bar.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_provider.dart';
import 'package:nepek_buyer/styles/popUps/loading_popup.dart';
import 'package:provider/provider.dart';

class ViewOrderProvider extends ChangeNotifier {
  String id;
  bool initFetch = false;
  Widget body = spinkit;
  Map orderData;

  Future getOrderData() async {
    final response = await get(
      '$peopleApi/buy_system/buyer/single_order?key=$id',
      headers: {"Authorization": 'Bearer ${UserPreferences().getJwtToken()}'},
    );
    orderData = jsonDecode(response.body);
    if (orderData != null) {
      body = ViewOrderLayout();
      initFetch = true;
      notifyListeners();
    }
  }
}

class ViewOrder extends StatelessWidget {
  final args;
  const ViewOrder({Key key, this.args}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ViewOrderProvider(),
      child: ViewOrderRoot(args: args),
    );
  }
}

class ViewOrderRoot extends StatelessWidget {
  final args;
  const ViewOrderRoot({Key key, this.args}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ViewOrderProvider provider = Provider.of(context);
    if (provider.initFetch == false) {
      provider.id = args['_id'];
      provider.getOrderData();
    }
    final bool darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    return Scaffold(
      appBar: defaultAppBar(context, 'Order', darkTheme),
      body: provider.body,
    );
  }
}

class ViewOrderLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ViewOrderProvider provider = Provider.of(context);
    final order = provider.orderData;
    final bool darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        Container(
          color: darkTheme ? Colors.black : Colors.white,
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              _leftRightData('Package No', order['package_No']),
              _leftRightData('Bought in', date(order['bought_date'])),
              _products(order),
              _leftRightData('Delivery Charge',
                  'NPR  ${order['delivery_charge'].toString()}.00'),
              _leftRightData('Total', 'NPR  ${order['total'].toString()}.00')
            ],
          ),
        )
      ],
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
                        _leftRightData('Price', 'NPR  ${product['price']}.00'),
                        _leftRightData(
                            'Quantity', '${product['qty'].toString()} Nos.'),
                        _statusDates(
                            'Placed Order in', product['placed_order_date'])
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
  TextStyle _heading() => GoogleFonts.poppins(
      // fontSize: 18,
      fontWeight: FontWeight.w700);
}

String date(date) => DateFormat.yMMMd('en_US').format(DateTime.parse(date));
