import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:nepek_buyer/functions/check_cart_products.dart';
import 'package:nepek_buyer/rootApp/widgets/RouterApp/main.dart';
import 'package:nepek_buyer/rootApp/widgets/loadingScreen/main.dart';
import 'dataFetch/main.dart';

class RootProvider with ChangeNotifier {
  bool initCheck = false;
  Widget body = LoadingScreen();

  Future initChecks() async {
    openDBS().then(
      (_) => checkClassification().then(
        (_) => checkDeliveryAddresses().then(
          (_) => isCartItemsAvailable().then(
            (_) => changeScreen(),
          ),
        ),
      ),
    );
  }

  Future checkDeliveryAddresses() async {
    await InjectDatas().getMyDeliveryAddresses().then(
          (_) => InjectDatas().testDeliveryAddress().then(
            (value) {
              if (!value) InjectDatas().fetchDeliveryAddress();
            },
          ),
        );
  }

  Future checkClassification() async {
    await InjectDatas().testClassification().then(
      (value) {
        if (!value) InjectDatas().fetchClassification();
      },
    );
  }

  Future openDBS() async {
    await Hive.openBox('search');
    await Hive.openBox('cart');
    await Hive.openBox('classifications');
    await Hive.openBox('deliveryAddresses');
    await Hive.openBox('home_page_data');
    await Hive.openBox('customProducts');
    await Hive.openBox('userDeliveryAreas');
  }

  changeScreen() {
    body = RouterApp();
    initCheck = true;
    notifyListeners();
  }
}
