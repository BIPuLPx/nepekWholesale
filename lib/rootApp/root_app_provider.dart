import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:skite_buyer/rootApp/widgets/RouterApp/main.dart';
import 'package:skite_buyer/rootApp/widgets/loadingScreen/main.dart';

class RootProvider with ChangeNotifier {
  bool initCheck = false;
  Widget body = LoadingScreen();

  Future initChecks() async {
    openDBS().then(
      (_) => Timer(Duration(seconds: 5), () {
        body = RouterApp();
        initCheck = true;
        notifyListeners();
        // 5s over, navigate to a new page
        // Navigator.pushNamed(context, MaterialPageRoute(builder: (_) => Screen2()));
      }),
    );
  }

  Future openDBS() async {
    await Hive.openBox('search');
    await Hive.openBox('cart');
  }
}
