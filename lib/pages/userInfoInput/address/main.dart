import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skite_buyer/pages/userInfoInput/address/address_provider.dart';
import 'package:skite_buyer/styles/appBars/default_app_bar.dart';
import 'package:skite_buyer/styles/colors.dart';
import 'package:skite_buyer/styles/darkThemes/dark_theme_provider.dart';
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
    final bool darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;

    if (deliveryadd.initInjection == false) {
      deliveryadd.makeInitinjection();
    }

    return Scaffold(
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
          color: darktheme ? Colors.white : AppColors().primaryBlue(),
          child: Text(
            'Done',
            style: GoogleFonts.nunitoSans(
              fontWeight: FontWeight.w600,
              color: darktheme ? Colors.black : null,
            ),
          ),
        ),
      ),
    );
  }
}
