import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:nepek_buyer/styles/appBars/default_app_bar.dart';
import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_provider.dart';

import 'checkout_provider.dart';

class CheckOutRoot extends StatelessWidget {
  final args;

  const CheckOutRoot({Key key, this.args}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // print(args);
    final DarkThemeProvider darktheme = Provider.of(context);
    final CheckoutProvider provider = Provider.of(context);
    if (provider.initFetcch == false) {
      provider.args = args;
      provider.initState();
    }
    return Scaffold(
      appBar: defaultAppBar(context, 'Checkout', darktheme.darkTheme),
      body: Container(
        margin: EdgeInsets.only(left: 15, right: 15),
        child: provider.body,
      ),
      bottomNavigationBar: BottomAppBar(
        child: FlatButton.icon(
          onPressed: () =>
              Navigator.pushNamed(context, 'payment_method', arguments: {
            'total': provider.totalPrice,
            'args': args,
          }),
          icon: Icon(
            Icons.arrow_forward_ios,
            color: darktheme.darkTheme ? Colors.black : Colors.white,
            size: 18,
          ),
          height: 50,
          color: darktheme.darkTheme ? Colors.white : AppColors().officialMatch(),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          label: Text(
            'Payment Methods',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              color: darktheme.darkTheme ? Colors.black : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class Checkout extends StatelessWidget {
  final args;
  const Checkout({Key key, this.args}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CheckoutProvider(),
      child: CheckOutRoot(args: args),
    );
  }
}
