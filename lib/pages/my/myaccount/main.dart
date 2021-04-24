import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:nepek_buyer/styles/appBars/default_app_bar.dart';
import 'package:nepek_buyer/styles/button/nepek_button.dart';
import 'package:nepek_buyer/styles/button/nepek_button_icon.dart';
import 'package:nepek_buyer/styles/text/normal_text.dart';
import 'package:provider/provider.dart';
import 'package:nepek_buyer/savedData/user_data.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_provider.dart';
import 'account_provider.dart';

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
      appBar: defaultAppBar(
        context,
        UserPreferences().getDisplayName(),
        darkTheme,
      ),
      body: ListView(
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NepekText(
                  value: "Default Delivery Area",
                  fontSize: 18,
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 150),
            child: NepekButton(
              label: 'Address Book',
              onClick: () => Navigator.of(context).pushNamed('address_book'),
              icon: NepekButtonIcon(
                Icons.location_city_outlined,
              ),
            ),
          )
        ],
      ),
      floatingActionButton: args['logout'] == true
          ? Container(height: 0, width: 0)
          : ProfileBottomNav(
              checkProfile: args['checkProfile'],
            ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
    );
  }
}

class ProfileBottomNav extends StatelessWidget {
  final Function checkProfile;
  const ProfileBottomNav({Key key, this.checkProfile}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return NepekButton(
      width: 150,
      reverse: true,
      iconReverse: true,
      icon: NepekButtonIcon(
        Icons.login_rounded,
        reversed: true,
      ),
      onClick: () {},
      label: 'Sign Out',
    );
  }
}
