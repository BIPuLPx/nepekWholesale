import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/pages/buy/confirmOrder/provider.dart';
import 'package:provider/provider.dart';
import 'package:nepek_buyer/styles/appBars/default_app_bar.dart';
import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_provider.dart';

class OrderDetailsRoot extends StatelessWidget {
  final args;
  const OrderDetailsRoot({Key key, this.args}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final bool darktheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    final OrderDetailsProvider provider = Provider.of(context);
    provider.args = args;
    provider.getDefaultAddress();
    final deliveryAddress = provider.deliveryAddress;
    return Scaffold(
      bottomNavigationBar: _confirmOrder(provider, context, darktheme),
      appBar: defaultAppBar(context, 'Order Details', darktheme),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _topBottomVal("Deliver To", provider.displayName),
            _topBottomVal("Phone Number", provider.phoneNumber),
            _topBottomVal("State", deliveryAddress['state']),
            _topBottomVal("District", deliveryAddress['district']),
            _topBottomVal("Area", deliveryAddress['area']),
            _topBottomVal("Estimated Delivery Time", '3 - 6 days'),
            SizedBox(height: 10),
            FlatButton(
              color: darktheme ? Colors.white : AppColors().officialMatch(),
              minWidth: double.infinity,
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  'account',
                  arguments: {
                    'checkProfile': () => provider.refresh(),
                    'logout': true
                  },
                );
              },
              child: Text(
                'Change Details',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  color: darktheme ? Colors.black : Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  BottomAppBar _confirmOrder(
      OrderDetailsProvider provider, BuildContext context, bool darktheme) {
    return BottomAppBar(
        child: SizedBox(
      height: 50,
      width: double.infinity,
      child: FlatButton.icon(
          color: darktheme ? Colors.white : AppColors().officialMatch(),
          onPressed: () => provider.confirmOrder(context),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          icon: Container(
            margin: EdgeInsets.only(right: 5),
            child: Icon(
              Icons.arrow_forward_ios_rounded,
              color: darktheme ? Colors.black : Colors.white,
              size: 17,
            ),
          ),
          label: Text(
            'Proceed to checkout',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              color: darktheme ? Colors.black : Colors.white,
            ),
          )),
    ));
  }

  Widget _topBottomVal(String top, String bottom) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            top,
            style: _deliveryAddress(true),
          ),
          Text(
            bottom,
            style: _deliveryAddress(false),
          ),
        ],
      ),
    );
  }

  TextStyle _deliveryAddress(bool heading) => GoogleFonts.poppins(
      fontWeight: heading ? FontWeight.w600 : FontWeight.w400);
}

class OrderDetails extends StatelessWidget {
  final args;
  const OrderDetails({Key key, this.args}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OrderDetailsProvider(),
      child: OrderDetailsRoot(args: args),
    );
  }
}
