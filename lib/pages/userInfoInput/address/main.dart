import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skite_buyer/pages/userInfoInput/address/address_provider.dart';
import 'package:skite_buyer/pages/userInfoInput/address/input_delivery_address/main.dart';
import 'package:skite_buyer/styles/colors.dart';
import 'package:skite_buyer/styles/font_styles.dart';

class AddDeliveryAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddDeliveryAddressState>(
      create: ((context) => AddDeliveryAddressState()),
      child: AddDeliveryAddressRoot(),
    );
  }
}

class AddDeliveryAddressRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deliveryadd = Provider.of<AddDeliveryAddressState>(context);

    if (deliveryadd.initInjection == false) {
      deliveryadd.makeInitinjection();
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Your Delivery Address', style: addDeliveryAddHeading()),
              InputDeliveryAddress(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(child: AddAddressBottomAppBar()),
    );
  }
}

TextStyle addDeliveryAddHeading() => GoogleFonts.ptSans(
      fontSize: 23,
      fontWeight: FontWeight.w600,
    );

class AddAddressBottomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deliveryadd = Provider.of<AddDeliveryAddressState>(context);

    return BottomAppBar(
      child: SizedBox(
        height: 50,
        child: FlatButton(
          onPressed: () {
            deliveryadd.finalizedLocation(context);
          },
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          color: AppColors().primaryBlue(),
          child: Text(
            'Done',
            style: AppFontStyle().button(Colors.white),
          ),
        ),
      ),
    );
  }
}
