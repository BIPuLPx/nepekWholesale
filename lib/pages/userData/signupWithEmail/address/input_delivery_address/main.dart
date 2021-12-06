import 'package:flutter/material.dart';
import 'package:nepek_buyer/styles/text/normal_text.dart';
import 'package:provider/provider.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_provider.dart';
import '../../signup_with_email_provider.dart';
import 'widgets/delivery_address_selector.dart';

class InputDeliveryAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final address = Provider.of<SignUpWithEmailProvider>(context);
    final bool darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;

    return Container(
      // child: Form(
      //   key: address.formKey,
      //   autovalidate: address.autovalidate,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30),
          NepekText(
            'Your Address',
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
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
            current: address.currentCity,
            dataList: address.deliveryCities,
            heading: 'City',
          ),
          SizedBox(height: 100)
        ],
      ),
    );
  }
}
