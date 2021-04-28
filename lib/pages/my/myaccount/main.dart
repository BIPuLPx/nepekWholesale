import 'package:flutter/material.dart';
import 'package:nepek_buyer/pages/my/myaccount/widgets/default_delivery_area.dart';
import 'package:nepek_buyer/styles/appBars/default_app_bar.dart';
import 'package:nepek_buyer/styles/button/nepek_button.dart';
import 'package:nepek_buyer/styles/button/nepek_button_icon.dart';
import 'package:nepek_buyer/styles/colors.dart';
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

    account.args = args;
    account.getUserData();

    return Scaffold(
      backgroundColor: darkTheme ? Colors.black : Colors.white,
      appBar: defaultAppBar(
        context,
        'Account',
        darkTheme,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Header(),
                    SizedBox(height: 10),
                    DeliveryAddressDefault(add: account.defaultDeliveryAddress),
                    ManageAddresses(account: account)
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: args['hideLogout'] == true
          ? Container(height: 0, width: 0)
          : ProfileBottomNav(),
    );
  }
}

class ManageAddresses extends StatelessWidget {
  const ManageAddresses({
    Key key,
    @required this.account,
  }) : super(key: key);

  final AccountState account;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.only(left: 20),
          margin: EdgeInsets.only(top: 60, bottom: 20),
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                color: AppColors.officialMatch,
                width: 2,
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NepekText(
                "Manage your addresses",
                fontWeight: FontWeight.w600,
                fontSize: 22,
              ),
              NepekText(
                "on Address Book",
                fontSize: 20,
                // fontWeight: FontWeight.w600,
                color: Colors.black54,
              ),
            ],
          ),
        ),
        Container(
          // padding: EdgeInsets.only(right: 150, top: 10),
          child: NepekButton(
            label: 'Address Book',
            onClick: () => Navigator.of(context).pushNamed(
              'address_book',
              arguments: account.refreshAccount,
            ),
            icon: NepekButtonIcon(
              Icons.location_city_outlined,
            ),
          ),
        ),
      ],
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: AppColors.officialMatch,
            width: 2,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NepekText(
            UserPreferences().getDisplayName().split(' ')[0],
            fontWeight: FontWeight.w600,
            fontSize: 22,
          ),
          NepekText(
            "Packages will be delivered to",
            fontSize: 20,
            // fontWeight: FontWeight.w600,
            color: Colors.black54,
          ),
        ],
      ),
    );
  }
}

class ProfileBottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AccountState provider = Provider.of(context);
    return NepekButton(
      width: 150,
      reverse: true,
      iconReverse: true,
      icon: NepekButtonIcon(
        Icons.login_rounded,
        reversed: true,
      ),
      onClick: () => provider.signOut(context),
      label: 'Sign Out',
    );
  }
}
