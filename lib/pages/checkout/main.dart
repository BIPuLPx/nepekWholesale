import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skite_buyer/pages/checkout/checkout_provider.dart';
import 'package:skite_buyer/styles/appBars/default_app_bar.dart';
import 'package:skite_buyer/styles/colors.dart';
import 'package:skite_buyer/styles/darkThemes/dark_theme_provider.dart';

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
        child: FlatButton(
          height: 50,
          color: darktheme.darkTheme ? Colors.white : AppColors().primaryBlue(),
          onPressed: () {},
          child: Text(
            'Buy Now',
            style: GoogleFonts.nunitoSans(
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
