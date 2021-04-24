import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:nepek_buyer/rootApp/dataFetch/syncCutomProducts.dart';
import 'package:nepek_buyer/savedData/apis.dart';
import 'package:nepek_buyer/savedData/user_data.dart';
import 'package:nepek_buyer/styles/popUps/errorPopUp.dart';
import 'package:http/http.dart' as http;
import 'package:nepek_buyer/styles/popUps/loading_popup.dart';
import 'package:nepek_buyer/styles/toasts/sucess_toast.dart';

class ContinueWithEmailProvider with ChangeNotifier {
  final Box userDeliveryAreas = Hive.box('userDeliveryAreas');
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
      loadingPopUP(context, "Signing In");
      final data = {"email": email, "password": password};
      final response = await http.post(
        '$peopleApi/customers/signin',
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data),
      );

      final resData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        UserPreferences().jwtToken(resData['token']);
        UserPreferences().displayName(resData['data']['displayName']);
        UserPreferences().buyerKey(resData['data']['_id']);
        UserPreferences().email(resData['data']['email']);

        userDeliveryAreas.put(
            'deliveryAreas', resData['data']['deliveryAreas']);
        if (resData['data']['deliveryAreas'].length > 0)
          userDeliveryAreas.put('default_delivery_area',
              resData['data']['default_delivery_area']);

        UserPreferences().loggedIn(true);
        SyncCustomProducts().syncWishListsWithBackend();
        sucessToast(context, 'Signed In');
        Navigator.of(context).pop();
        refresh();
      } else if (response.statusCode == 405) {
        Navigator.of(context).pop();
        errorPopup(context, 'Username or password is incorrect');
      }
    }
  }
}
