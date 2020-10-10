import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skite_buyer/pages/userInfoInput/address/address_provider.dart';
import 'package:skite_buyer/pages/userInfoInput/address/input_delivery_address/widgets/delivery_address_selector.dart';

import '../main.dart';

class InputDeliveryAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final address = Provider.of<AddDeliveryAddressState>(context);
    // print(address.deliveryStates);
    return Scaffold(
      bottomNavigationBar: BottomAppBar(child: AddAddressBottomAppBar()),
      body: Container(
        margin: EdgeInsets.only(left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Your Delivery Address', style: _addDeliveryAddHeading()),
            SizedBox(height: 50),
            DeliveryAddressSelector(
              current: address.currentState,
              dataList: address.deliveryStates,
              heading: 'state',
            ),
            DeliveryAddressSelector(
              current: address.currentDistrict,
              dataList: address.deliveryDistricts,
              heading: 'district',
            ),
            DeliveryAddressSelector(
              current: address.currentArea,
              dataList: address.deliveryAreas,
              heading: 'area',
            )
          ],
        ),
      ),
    );
  }

  TextStyle _addDeliveryAddHeading() => GoogleFonts.cabin(
        fontSize: 23,
        fontWeight: FontWeight.w600,
      );
}
