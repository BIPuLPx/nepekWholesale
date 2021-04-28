import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/styles/button/nepek_button.dart';
import 'package:nepek_buyer/styles/button/nepek_button_icon.dart';
import 'package:nepek_buyer/styles/text/normal_text.dart';
import 'package:provider/provider.dart';
import 'package:nepek_buyer/styles/appBars/default_app_bar.dart';
import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_provider.dart';

import 'provider.dart';
import 'widgets/default_delivery_area.dart';
import 'widgets/no_default_address.dart';

class OrderDetailsRoot extends StatelessWidget {
  final args;
  const OrderDetailsRoot({Key key, this.args}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final bool darktheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    final OrderDetailsProvider provider = Provider.of(context);
    provider.args = args;
    provider.getDefaultAddress();
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: _proceedToCheckout(provider, context, darktheme),
      appBar: defaultAppBar(context, 'Order Details', darktheme),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            SizedBox(height: 10),
            provider.defaultDeliveryAddress.length > 0
                ? DeliveryAddressDefaultOrder(
                    add: provider.defaultDeliveryAddress)
                : NoDefaultAddress(),
            SizedBox(height: 50),
            NepekButton(
              onClick: () {
                Navigator.pushNamed(
                  context,
                  'account',
                  arguments: {
                    'checkProfile': () => provider.refresh(),
                    'hideLogout': true
                  },
                );
              },
              label: provider.defaultDeliveryAddress.length > 0
                  ? 'Change Default Address'
                  : 'Add Default Address',
              icon: NepekButtonIcon(
                Icons.location_on_outlined,
                reversed: true,
                size: 22,
              ),
              reverse: true,
              fontSize: 14,
              padding: 0,
              height: 40,
            )
          ],
        ),
      ),
    );
  }

  BottomAppBar _proceedToCheckout(
      OrderDetailsProvider provider, BuildContext context, bool darktheme) {
    return BottomAppBar(
      child: Container(
          padding: EdgeInsets.all(10),
          child: NepekButton(
            onClick: () => provider.confirmOrder(context),
            icon: Container(
              margin: EdgeInsets.only(right: 5),
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                color: darktheme ? Colors.black : Colors.white,
                size: 17,
              ),
            ),
            label: 'Proceed to checkout',
          )),
    );
  }
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
