import 'package:flutter/material.dart';
import 'package:nepek_buyer/pages/my/address_book/widgets/changeDefault.dart';
import 'package:nepek_buyer/pages/my/address_book/widgets/delivery_address.dart';
import 'package:nepek_buyer/pages/my/address_book/widgets/floating_actions.dart';
import 'package:nepek_buyer/styles/appBars/default_app_bar.dart';

class AddressBook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: defaultAppBar(context, 'Address Book', false),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            // padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DeliveryAddress(),
                DeliveryAddress(),
                DeliveryAddress(),
              ],
            ),
          ),
          SizedBox(height: 100)
        ],
      ),
      floatingActionButton: FloatingActions(),
    );
  }
}
