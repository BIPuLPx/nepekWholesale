import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:nepek_buyer/functions/token_header.dart';
import 'package:nepek_buyer/pages/my/returns/widgets/no_returns/main.dart';
import 'package:nepek_buyer/pages/my/returns/widgets/yes_returns/main.dart';
import 'package:nepek_buyer/savedData/apis.dart';
import 'package:nepek_buyer/savedData/httpUri.dart';
import 'package:nepek_buyer/styles/spinkit.dart';

class ReturnsProvider with ChangeNotifier {
  bool initFetch = false;
  Widget body = logoLoader();
  List packages;

  Future getReturns() async {
    final res = await get(
      httpUri(serviceOne, 'buy_system/buyer/returning_products'),
      headers: tokenHeader(),
    );
    packages = jsonDecode(res.body);

    if (packages.length > 0)
      body = YesReturns();
    else
      body = NoReturns();
    initFetch = true;
    notifyListeners();
  }

  refresh() {
    print('refresh');
  }
}
