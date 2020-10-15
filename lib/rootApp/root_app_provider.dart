import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:skite_buyer/rootApp/widgets/RouterApp/main.dart';
import 'package:skite_buyer/rootApp/widgets/loadingScreen/main.dart';

import 'package:skite_buyer/savedData/apis.dart';

import 'dataFetch/main.dart';

class RootProvider with ChangeNotifier {
  bool initCheck = false;
  Widget body = LoadingScreen();

  Future initChecks() async {
    openDBS().then(
      (_) => InjectDatas().testClassification().then(
        (value) {
          if (!value) {
            InjectDatas().fetchClassification().then((_) => changeScreen());
          } else {
            changeScreen();
          }
        },
      ),
    );
  }

  Future openDBS() async {
    await Hive.openBox('search');
    await Hive.openBox('cart');
    await Hive.openBox('classifications');
  }

  changeScreen() {
    body = RouterApp();
    initCheck = true;
    notifyListeners();
  }
}
