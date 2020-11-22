import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:nepek_buyer/styles/darkThemes/dark_theme_provider.dart';

import '../address_provider.dart';
import '../main.dart';
import 'widgets/delivery_address_selector.dart';

class InputDeliveryAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final address = Provider.of<AddDeliveryAddressState>(context);
    final bool darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    // print(address.deliveryStates);
    return Scaffold(
      backgroundColor: darkTheme ? Colors.black : Colors.white,
      bottomNavigationBar: BottomAppBar(child: AddAddressBottomAppBar()),
      body: Container(
        margin: EdgeInsets.only(left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Your Delivery Address', style: _addDeliveryAddHeading()),
            SizedBox(height: 10),
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
              current: address.currentRegion,
              dataList: address.deliveryRegions,
              heading: 'region',
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

  TextStyle _addDeliveryAddHeading() => GoogleFonts.poppins(
        fontSize: 23,
        fontWeight: FontWeight.w700,
      );
}
