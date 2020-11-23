import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:nepek_buyer/styles/appBars/default_app_bar.dart';
import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_provider.dart';

import 'address_provider.dart';

class AddDeliveryAddress extends StatelessWidget {
  final args;
  const AddDeliveryAddress({Key key, this.args}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddDeliveryAddressState>(
      create: ((context) => AddDeliveryAddressState()),
      child: AddDeliveryAddressRoot(args: args),
    );
  }
}

class AddDeliveryAddressRoot extends StatelessWidget {
  final args;
  const AddDeliveryAddressRoot({Key key, this.args}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deliveryadd = Provider.of<AddDeliveryAddressState>(context);
    final bool darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;

    if (deliveryadd.initInjection == false) {
      deliveryadd.args = args;
      deliveryadd.makeInitinjection();
    }

    return Scaffold(
      backgroundColor: darkTheme ? Colors.black : Colors.white,
      appBar: defaultAppBar(context, 'Address', darkTheme),
      body: deliveryadd.body,
    );
  }
}

class AddAddressBottomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deliveryadd = Provider.of<AddDeliveryAddressState>(context);
    final darktheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    return BottomAppBar(
      child: SizedBox(
        height: 50,
        child: FlatButton(
          onPressed: () {
            // darktheme.darkTheme = !darktheme.darkTheme;
            deliveryadd.finalizedLocation(context);
          },
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          color: darktheme ? Colors.white : AppColors().officialMatch(),
          child: Text(
            'Done',
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: darktheme ? Colors.black : Colors.white),
          ),
        ),
      ),
    );
  }
}
