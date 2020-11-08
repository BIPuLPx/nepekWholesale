import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:nepek_buyer/rootApp/widgets/RouterApp/main.dart';
import 'package:nepek_buyer/rootApp/widgets/loadingScreen/main.dart';
import 'dataFetch/main.dart';

class RootProvider with ChangeNotifier {
  bool initCheck = false;
  Widget body = LoadingScreen();

  Future initChecks() async {
    openDBS().then(
      (_) => InjectDatas().testClassification().then(
        (value) {
          if (!value) {
            InjectDatas().fetchClassification().then(
                (_) => checkDeliveryAddresses().then((_) => changeScreen()));
          } else {
            checkDeliveryAddresses().then((_) => changeScreen());
          }
        },
      ),
    );
  }

  Future checkDeliveryAddresses() async {
    await InjectDatas().testDeliveryAddress().then((value) {
      if (!value) {
        InjectDatas().fetchDeliveryAddress();
      }
    });
  }

  Future openDBS() async {
    await Hive.openBox('search');
    await Hive.openBox('cart');
    await Hive.openBox('classifications');
    await Hive.openBox('deliveryAddresses');
    await Hive.openBox('home_page_data');
  }

  changeScreen() {
    body = RouterApp();
    initCheck = true;
    notifyListeners();
  }
}
