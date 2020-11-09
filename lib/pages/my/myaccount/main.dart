import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:nepek_buyer/savedData/user_data.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_provider.dart';
import 'package:nepek_buyer/styles/toasts/sucess_toast.dart';

import 'account_provider.dart';
import 'appBar.dart';
import 'content/main.dart';
import 'shippingaddress/default.dart';
import 'shippingaddress/main.dart';

class AccountPage extends StatelessWidget {
  final args;
  const AccountPage({Key key, this.args}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AccountState>(
      create: ((context) => AccountState()),
      child: AccountPageRoot(args: args),
    );
  }
}

class AccountPageRoot extends StatelessWidget {
  final args;
  const AccountPageRoot({Key key, this.args}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final account = Provider.of<AccountState>(context);
    final bool darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    if (account.initState == false) {
      account.args = args;
      account.getUserData();
    }
    // print(args);
    // print(account.phoneNumber);
    return Scaffold(
      backgroundColor: darkTheme ? Colors.black : Colors.white,
      body: CustomScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        slivers: [
          profileAppBar(context),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(height: 50),
                AccountContent(
                  heading: 'Phone Number',
                  value: [account.phoneNumber],
                  hasValue: account.phoneNumber == null ? false : true,
                  changeRoute: 'input_phone_number',
                ),
                DefaultDeliveryAddress(),
                ShippingAddress()
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: args['logout'] == true
          ? Container(height: 0, width: 0)
          : ProfileBottomNav(
              checkProfile: args['checkProfile'],
            ),
    );
  }
}

class ProfileBottomNav extends StatelessWidget {
  final Function checkProfile;
  const ProfileBottomNav({Key key, this.checkProfile}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: SizedBox(
        height: 50,
        child: FlatButton.icon(
          color: Colors.red[100],
          icon: Icon(
            Icons.arrow_back,
            color: Colors.red,
          ),
          onPressed: () {
            final deliveryAddBox = Hive.box('deliveryAddresses');
            deliveryAddBox.put('userAreas', null);
            UserPreferences().displayName(null);
            UserPreferences().buyerKey(null);
            UserPreferences().jwtToken(null);
            UserPreferences().phoneNumber(null);
            UserPreferences().loggedIn(false);
            checkProfile();
            sucessToast(context, 'Signed Out');
            Navigator.of(context).pop();
          },
          // color: Colors.red[50],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          label: Text(
            'Sign Out',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
