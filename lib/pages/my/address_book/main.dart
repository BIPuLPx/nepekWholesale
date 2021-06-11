import 'package:flutter/material.dart';
import 'package:nepek_buyer/pages/my/address_book/provider.dart';
import 'package:nepek_buyer/pages/my/address_book/widgets/delivery_address.dart';
import 'package:nepek_buyer/pages/my/address_book/widgets/floating_actions.dart';
import 'package:nepek_buyer/styles/appBars/default_app_bar.dart';
import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/empty_data/main.dart';
import 'package:nepek_buyer/styles/text/normal_text.dart';
import 'package:provider/provider.dart';

class AddressBook extends StatelessWidget {
  final refresh;

  const AddressBook({Key key, this.refresh}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AddressBookProvider(),
      child: AddressBookRoot(refresh: refresh),
    );
  }
}

class AddressBookRoot extends StatelessWidget {
  final refresh;

  const AddressBookRoot({Key key, this.refresh}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final AddressBookProvider provider = Provider.of(context);

    provider.refreshAccount = refresh;
    provider.init();

    final deliveryAddresses = provider.deliveryAddresses;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: defaultAppBar(context, 'Address Book', false),
      body: deliveryAddresses.length > 0
          ? ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Container(
                  // padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: deliveryAddresses
                          .map((add) => DeliveryAddress(add: add))
                          .toList()),
                ),
                SizedBox(height: 100)
              ],
            )
          : EmptyData(
              asset: 'no_delivery_addresses',
              label: 'No Delivery Addresses',
            ),
      floatingActionButton: FloatingActions(),
    );
  }
}
