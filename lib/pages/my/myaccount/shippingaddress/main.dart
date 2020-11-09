import 'package:flutter/material.dart';
import 'package:nepek_buyer/pages/my/myaccount/content/account_heading.dart';
import 'package:nepek_buyer/pages/my/myaccount/content/content_value.dart';
import 'package:nepek_buyer/pages/my/myaccount/content/main.dart';
import 'package:provider/provider.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_provider.dart';

import '../account_provider.dart';

class ShippingAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AccountState provider = Provider.of(context);
    final bool darktheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    return Container(
      margin: EdgeInsets.only(bottom: 30, left: 30, right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AccountHeading(heading: "Delivery Addresses"),
          SizedBox(height: 5),
          Column(
            children: provider.deliveryAddresses
                .map((deliveryAddress) =>
                    _deliveryAddresses(deliveryAddress, provider, context))
                .toList(),
          ),
          provider.deliveryAddresses.length < 3
              ? addVal(
                  darktheme,
                  'input_delivery_address',
                  provider.deliveryAddresses.length == 0
                      ? 'Add delivery address'
                      : 'Add another address',
                  context)
              : Container()
        ],
      ),
    );
  }

  Row _deliveryAddresses(
      deliveryAddress, AccountState provider, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AccountContentValue(value: deliveryAddress['label']),
        IconButton(
          icon: Icon(
            Icons.delete_outline,
            color: Colors.redAccent[100],
          ),
          onPressed: () {
            provider.deleteDeliveryAddress(context, deliveryAddress);
          },
        )
      ],
    );
  }
}
