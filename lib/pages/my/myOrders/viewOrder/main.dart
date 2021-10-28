import 'package:flutter/material.dart';
import 'package:nepek_buyer/styles/appBars/default_app_bar.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_provider.dart';
import 'package:nepek_buyer/styles/network_image.dart';
import 'package:nepek_buyer/styles/text/format_date.dart';
import 'package:nepek_buyer/styles/text/format_price.dart';
import 'package:nepek_buyer/styles/text/left_right_data.dart';
import 'package:nepek_buyer/styles/text/normal_text.dart';
import 'package:nepek_buyer/styles/text/trimName.dart';
import 'package:provider/provider.dart';

import 'provider.dart';

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

    var totalPrice = order['price'] * order['qty'];

    if (order['delivery_charge'] != null)
      totalPrice += order['delivery_charge'];

    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        Container(
          color: darkTheme ? Colors.black : Colors.white,
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OrderImage(image: order['image']),
              SizedBox(height: 20),
              _status(order),
              SizedBox(height: 20),
              leftRightData(
                'PackageNo',
                order['packageNO'],
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
              SizedBox(height: 5),
              leftRightData(
                'Ordered in',
                formatDate(order['bought_date']),
                fontSize: 16,
              ),
              SizedBox(height: 5),
              leftRightData(
                'Product',
                trimName(order['productName'], 25),
                fontSize: 16,
              ),
              SizedBox(height: 20),
              NepekText(
                'Package Cost',
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(height: 5),
              leftRightData(
                "Price",
                formatPrice(order['price']),
                fontSize: 16,
              ),
              SizedBox(height: 5),
              leftRightData(
                "Qty",
                '${order['qty']} Nos.',
                fontSize: 16,
              ),
              SizedBox(height: 5),
              order['delivery_charge'] != null
                  ? leftRightData(
                      "Delivery Charge",
                      formatPrice(order['delivery_charge']),
                      fontSize: 16,
                    )
                  : SizedBox(),
              SizedBox(height: 5),
              leftRightData(
                "Total",
                formatPrice(totalPrice),
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: NepekText(
                  'inclusive of VAT',
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 20),
              NepekText(
                'Deliver To',
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              NepekText(
                order['deliveryName'],
                fontSize: 16,
              ),
              NepekText(
                order['deliveryAddress'],
                fontSize: 16,
              ),
              NepekText(
                order['deliveryPhone'].toString(),
                fontSize: 16,
              ),
              SizedBox(height: 20),
            ],
          ),
        )
      ],
    );
  }

  Widget _status(product) {
    Map status;

    if (product['placed_order_date'] == null) {
      status = {'status': 'Pending by Seller', 'type': 0};
    } else if (product['picked_date'] == null) {
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
        return Colors.greenAccent.shade400;
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

class OrderImage extends StatelessWidget {
  final String image;
  const OrderImage({Key key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: NepekImageNetwork(
        url: image,
        height: 150,
        width: 150,
      ),
    );
  }
}
