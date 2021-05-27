import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:nepek_buyer/functions/token_header.dart';
import 'package:nepek_buyer/savedData/apis.dart';
import 'package:nepek_buyer/savedData/httpUri.dart';
import 'package:nepek_buyer/styles/popUps/loading_popup.dart';
import 'package:nepek_buyer/styles/popUps/sucessPopup.dart';
import 'package:nepek_buyer/styles/spinkit.dart';

import 'widgets/layout/main.dart';
import 'widgets/no_eligible_returns/main.dart';

class EligibleReturnsProvider with ChangeNotifier {
  var refreshBack;
  Widget body = logoLoader();
  bool initFetched = false;
  List packages = [];
  String reason = 'Damaged / Broken';
  String otherReason = '';
  String id;

  Future getPackages() async {
    final res = await get(
      httpUri(peopleApi, 'buy_system/buyer/eligible_returns'),
      headers: tokenHeader(),
    );
    packages = jsonDecode(res.body);

    if (packages.length > 0)
      body = EligibleReturnsLayout();
    else
      body = NoEligibleReturns();

    initFetched = true;
    notifyListeners();
  }

  setReason(String value) {
    reason = value;
    notifyListeners();
  }

  Future returnPackage(BuildContext context) async {
    loadingPopUP(context, 'Requesting return');
    final data = {
      '_id': id,
      'return_reason': reason + otherReason,
    };
    final res = await put(
      httpUri(peopleApi, 'buy_system/buyer/return_product'),
      headers: tokenHeaderContentType(),
      body: jsonEncode(data),
    );
    print(res.statusCode);
    if (res.statusCode == 200) {
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.pop(context);
      refreshBack();
      sucessFulPopup(
        context,
        'Your package is requested for return\nYou will get a call from us soon !',
      );
    }
  }

// /buy_system/buyer/return_product
}
