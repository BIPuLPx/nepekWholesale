import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skite_buyer/pages/account/account_provider.dart';
import 'package:skite_buyer/pages/account/appBar.dart';
import 'package:skite_buyer/pages/account/content/main.dart';
import 'package:skite_buyer/pages/account/shippingaddress/main.dart';
import 'package:skite_buyer/savedData/user_data.dart';
import 'package:skite_buyer/styles/font_styles.dart';
import 'package:skite_buyer/styles/toasts/sucess_toast.dart';

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
    if (account.initState == false) {
      account.getUserData();
    }
    // print(args);
    // print(account.phoneNumber);
    return Scaffold(
      // appBar:
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
                ShippingAddress()
              ],
            ),
          )
        ],
      ),

      // Container(
      //   width: double.infinity,
      //   padding: EdgeInsets.only(left: 15, right: 15),
      //   color: Colors.white,
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       SizedBox(height: 15),
      //       AccountContent(
      //         heading: 'Phone Number',
      //         value: [account.phoneNumber],
      //         hasValue: account.phoneNumber == null ? false : true,
      //         changeRoute: 'input_phone_number',
      //       ),
      //       AccountContent(
      //         heading: 'Shipping Address',
      //         value: [account.state, account.district, account.area],
      //         hasValue: account.area == null ? false : true,
      //         changeRoute: 'input_delivery_address',
      //       )
      //     ],
      //   ),
      // ),
      bottomNavigationBar: ProfileBottomNav(
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
            UserPreferences().displayName(null);
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
            style: GoogleFonts.nunitoSans(
              fontWeight: FontWeight.w600,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
