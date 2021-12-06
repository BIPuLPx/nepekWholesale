import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:nepek_buyer/library/account/notification_token.dart';
import 'package:nepek_buyer/library/sync/custom_products.dart';
import 'package:nepek_buyer/savedData/apis.dart';
import 'package:nepek_buyer/savedData/httpUri.dart';
import 'package:nepek_buyer/savedData/user_data.dart';
import 'package:nepek_buyer/styles/popUps/errorPopUp.dart';
import 'package:http/http.dart' as http;
import 'package:nepek_buyer/styles/popUps/loading_popup.dart';
import 'package:nepek_buyer/styles/toasts/sucess_toast.dart';
import 'package:url_launcher/url_launcher.dart';

class ContinueWithEmailProvider with ChangeNotifier {
  final Box userAddress = Hive.box('userAddress');
  String thirdPartyRoute;
  bool initState = false;
  Function refresh;

  String email;
  String password;

  void inputChanged(String type, String val) {
    if (type == 'email') {
      email = val;
    } else {
      password = val;
    }
  }

  Future signIn(BuildContext context) async {
    // print(thirdPartyRoute);
    // print(email);
    if (email == null || password == null) {
      errorPopup(context, "Fill both email and password");
    } else {
      loadingPopUP(context, "Signing In");
      final data = {"email": email, "password": password};
      final response = await http.post(
        httpUri(serviceOne, 'customers/signin'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data),
      );

      final resData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        checkNotifyTokenAdded();
        UserPreferences().jwtToken(resData['token']);
        UserPreferences().displayName(resData['data']['displayName']);
        UserPreferences().customerKey(resData['data']['_id']);
        UserPreferences().email(resData['data']['email']);
        UserPreferences().pKey(resData['data']['pKey']);

        userAddress.add(resData['data']['address']);
        UserPreferences().loggedIn(true);
        SyncCustomProducts().syncWishListsWithBackend();
        sucessToast(context, 'Signed In');

        if (thirdPartyRoute == null)
          Navigator.of(context).pop();
        else if (thirdPartyRoute == 'add_listing')
          Navigator.pushReplacementNamed(context, 'add_listing');
        // Navigator.popUntil(context, ModalRoute.withName(thirdPartyRoute));
        refresh();
      } else if (response.statusCode == 203) {
        Navigator.of(context).pop();
        errorPopup(context, 'Username or password is incorrect');
      }
    }
  }

  forgotPassword() async* {
    final _url = 'https://nepek.com/forgot_password';
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
  }
}
