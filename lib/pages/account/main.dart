import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skite_buyer/pages/account/account_provider.dart';
import 'package:skite_buyer/pages/account/appBar.dart';
import 'package:skite_buyer/pages/account/content/main.dart';
import 'package:skite_buyer/styles/font_styles.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AccountState>(
      create: ((context) => AccountState()),
      child: AccountPageRoot(),
    );
  }
}

class AccountPageRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final account = Provider.of<AccountState>(context);

    if (account.initState == false) {
      account.getUserData();
    }
    // print(account.phoneNumber);
    return Scaffold(
      appBar: profileAppBar(context),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.only(left: 15, right: 15),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15),
            AccountContent(
              heading: 'Phone Number',
              value: [account.phoneNumber],
              hasValue: account.phoneNumber == null ? false : true,
              changeRoute: 'input_phone_number',
            ),
            AccountContent(
              heading: 'Shipping Address',
              value: [account.state, account.district, account.area],
              hasValue: account.area == null ? false : true,
              changeRoute: 'input_delivery_address',
            )
          ],
        ),
      ),
      bottomNavigationBar: ProfileBottomNav(),
    );
  }
}

class ProfileBottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: SizedBox(
        height: 50,
        child: FlatButton(
          onPressed: () {},
          color: Colors.pink[50],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          child: Text(
            'Sign Out',
            style: AppFontStyle().button(Colors.pink),
          ),
        ),
      ),
    );
  }
}
