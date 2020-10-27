import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:skite_buyer/pages/home/tabs/profile/widgets/not_sigin_in/dialogs/connecting.dart';
import 'package:skite_buyer/savedData/apis.dart';
import 'package:skite_buyer/savedData/user_data.dart';
import 'package:skite_buyer/styles/toasts/sucess_toast.dart';

class NotSignedInState extends ChangeNotifier {
  bool initState = false;
  Function checkLogged;
  String thirdPartyRoute;

  void continueWithEmail(BuildContext context) {
    // print(checkLogged);
    // checkLogged();
    Navigator.pushNamed(
      context,
      "continue_with_email",
      arguments: {"refresh": checkLogged, "thirdPartyRoute": thirdPartyRoute},
    );
  }

  Future signInWithFacebook(BuildContext context) async {
    final LoginResult result = await FacebookAuth.instance.login();
    final FacebookAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(result.accessToken.token);
    connecting(context);
    firebaseAuth(context, facebookAuthCredential);
  }

  Future firebaseAuth(BuildContext context, facebookAuthCredential) async {
    final userFromFireBase = await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential);
    Map user = {'uid': '', 'displayName': '', 'email': ''};
    user['uid'] = userFromFireBase.user.uid;
    user['displayName'] = userFromFireBase.user.displayName;
    user['email'] = userFromFireBase.user.email;
    backendVerify(context, user);
  }

/////////////
/////////////
/////////////
/////////////
/////////////
/////////////
  Future backendVerify(BuildContext context, Map authData) async {
    final response = await http.post(
      '$peopleApi/customers/oauth',
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(authData),
    );
    final backendData = jsonDecode(response.body);
    UserPreferences().jwtToken(backendData['token']);
    UserPreferences().displayName(backendData['data']['displayName']);
    UserPreferences().buyerKey(backendData['data']['uid']);
    UserPreferences().loggedIn(true);
    sucessToast(context, 'Sucessfully Signed In');
    checkLogged();
    if (thirdPartyRoute == null) {
      notThirdPartyRoute(backendData, context);
    } else {
      yesThirdPartyRoute(backendData, context, thirdPartyRoute);
    }
/////
    ///
    ///
    ///
    ///
    ///
    ///
  }
}

void notThirdPartyRoute(backendData, context) {
  final deliveryAddBox = Hive.box('deliveryAddresses');
  if (backendData['left'] == 'all' || backendData['left'] == 'phone') {
    Navigator.of(context).pop();
    Navigator.pushNamed(
      context,
      'input_phone_number',
      arguments: {'deliveryAdd': true},
    );
  } else if (backendData['left'] == 'location') {
    UserPreferences().phoneNumber(backendData['data']['phone'].toString());
    Navigator.of(context).pop();
    Navigator.pushNamed(context, 'input_delivery_address');
  } else {
    UserPreferences().phoneNumber(backendData['data']['phone'].toString());
    deliveryAddBox.put('userAreas', backendData['data']['deliveryAreas']);

    Navigator.of(context).pop();
  }
}

void yesThirdPartyRoute(backendData, context, route) {
  // print(route);
  final deliveryAddBox = Hive.box('deliveryAddresses');
  if (backendData['left'] == 'all' || backendData['left'] == 'phone') {
    Navigator.of(context).pop();
    Navigator.popUntil(context, ModalRoute.withName("view_product"));
  } else if (backendData['left'] == 'location') {
    UserPreferences().phoneNumber(backendData['data']['phone'].toString());
    Navigator.of(context).pop();
    Navigator.popUntil(context, ModalRoute.withName("view_product"));
  } else {
    UserPreferences().phoneNumber(backendData['data']['phone'].toString());
    deliveryAddBox.put('userAreas', backendData['data']['deliveryAreas']);
    Navigator.popUntil(context, ModalRoute.withName("view_product"));
  }
}
