import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:skite_buyer/savedData/apis.dart';
import 'package:skite_buyer/savedData/user_data.dart';
import 'package:skite_buyer/styles/popUps/errorPopUp.dart';
import 'package:http/http.dart' as http;
import 'package:skite_buyer/styles/popUps/loading_popup.dart';
import 'package:skite_buyer/styles/toast.dart';

class ContinueWithEmailProvider with ChangeNotifier {
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

///////////////////////////////
///////////////////////////////
///////////////////////////////
///////////////////////////////
///////////////////////////////
///////////////////////////////
  Future signIn(BuildContext context) async {
    // print(thirdPartyRoute);
    // print(email);
    if (email == null || password == null) {
      errorPopup(context, "Fill both email and password");
    } else {
      loadingPopUP(context, "Signing in");
      final data = {"email": email, "password": password};
      final response = await http.post(
        '$peopleApi/customers/signin',
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data),
      );

      final resData = jsonDecode(response.body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        Navigator.of(context).pop();
        UserPreferences().jwtToken(resData['token']);
        UserPreferences().displayName(resData['data']['displayName']);
        UserPreferences().buyerKey(resData['data']['uid']);
        UserPreferences().loggedIn(true);
        showToast(context, 'Sucessfully Signed In');
        refresh();
        if (thirdPartyRoute == null) {
          notThirdPartyRoute(resData, context);
        } else {
          yesThirdPartyRoute(resData, context, thirdPartyRoute);
        }
      } else if (response.statusCode == 405) {
        Navigator.of(context).pop();
        errorPopup(context, 'Username or password is incorrect');
      }
    }
  }
}

void yesThirdPartyRoute(resData, context, route) {
  // print(route);
  final deliveryAddBox = Hive.box('deliveryAddresses');
  if (resData['left'] == 'all' || resData['left'] == 'phone') {
    Navigator.of(context).pop();
    Navigator.popUntil(context, ModalRoute.withName("view_product"));
  } else if (resData['left'] == 'location') {
    UserPreferences().phoneNumber(resData['data']['phone'].toString());
    Navigator.of(context).pop();
    Navigator.popUntil(context, ModalRoute.withName("view_product"));
  } else {
    UserPreferences().phoneNumber(resData['data']['phone'].toString());
    deliveryAddBox.put('userAreas', resData['data']['deliveryAreas']);
    Navigator.popUntil(context, ModalRoute.withName("view_product"));
  }
}

void notThirdPartyRoute(resData, context) {
  final deliveryAddBox = Hive.box('deliveryAddresses');
  if (resData['left'] == 'all' || resData['left'] == 'phone') {
    Navigator.of(context).pop();
    Navigator.pushNamed(
      context,
      'input_phone_number',
      arguments: {'deliveryAdd': true},
    );
  } else if (resData['left'] == 'location') {
    UserPreferences().phoneNumber(resData['data']['phone'].toString());
    Navigator.of(context).pop();
    Navigator.pushNamed(context, 'input_delivery_address');
  } else {
    UserPreferences().phoneNumber(resData['data']['phone'].toString());
    deliveryAddBox.put('userAreas', resData['data']['deliveryAreas']);
    Navigator.of(context).pop();
  }
}
