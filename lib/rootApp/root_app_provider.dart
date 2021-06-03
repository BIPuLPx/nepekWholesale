import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:nepek_buyer/functions/check_cart_products.dart';
import 'package:nepek_buyer/library/sync/account.dart';
import 'package:nepek_buyer/library/sync/delivery_addresses.dart';
import 'package:nepek_buyer/rootApp/widgets/RouterApp/main.dart';
import 'package:nepek_buyer/rootApp/widgets/loadingScreen/main.dart';

class RootProvider with ChangeNotifier {
  bool initCheck = false;
  Widget body = LoadingScreen();
  final SyncAccount _account = SyncAccount();

  Future initChecks() async {
    await openDBS().then(
      (_) async {
        await _account.start();
        await SyncDeliveryAddresses().getMyDeliveryAddresses();
        await isCartItemsAvailable();
        changeScreen();
      },
    );
  }

  Future openDBS() async {
    await Hive.openBox('search');
    await Hive.openBox('cart');
    await Hive.openBox('classifications');
    await Hive.openBox('deliveryAddresses');
    await Hive.openBox('homeScreen');
    await Hive.openBox('customProducts');
    await Hive.openBox('userDeliveryAreas');
    await Hive.openBox('notifications');
  }

  changeScreen() {
    body = RouterApp();
    initCheck = true;
    notifyListeners();
  }
}
