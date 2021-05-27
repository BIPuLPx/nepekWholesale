import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:nepek_buyer/functions/token_header.dart';
import 'package:nepek_buyer/library/account/signOut.dart';
import 'package:nepek_buyer/savedData/apis.dart';
import 'package:nepek_buyer/savedData/httpUri.dart';
import 'package:nepek_buyer/savedData/user_data.dart';

class SyncAccount {
  final UserPreferences _prefs = UserPreferences();

  Future start() async {
    if (_prefs.getLoggedIn() == true) {
      final String pKey = _prefs.getPkey();
      final res = await get(
        httpUri(
          peopleApi,
          'customers/checkPkey?pKey=$pKey',
        ),
        headers: tokenHeader(),
      );
      if (res.statusCode != 200) signOutUser();
    }
  }
}
