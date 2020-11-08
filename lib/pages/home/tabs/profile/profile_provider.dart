import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nepek_buyer/pages/home/tabs/profile/widgets/not_sigin_in/main.dart';
import 'package:nepek_buyer/pages/home/tabs/profile/widgets/signed_in/main.dart';
import 'package:nepek_buyer/savedData/user_data.dart';

class ProfileState extends ChangeNotifier {
  bool initCheck = false;
  Widget currentScreen;
  String externalRoute;

  void checkLogged() {
    // print("checklogged is here");
    if (UserPreferences().getLoggedIn() == true) {
      currentScreen = SignedIn();
    } else {
      currentScreen = NotSignedIn();
    }
    if (initCheck == true) {
      notifyListeners();
    } else {
      initCheck = true;
    }
  }
}
