import 'package:flutter/material.dart';
import 'package:skite_buyer/pages/home/main.dart';

class ResultRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    //CAN ACCESS OBJECT
    final args = settings.arguments;

    switch (settings.name) {
      case 'result':
        return MaterialPageRoute(builder: (_) => HomePage(index: args));

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: SafeArea(child: Text("TESt")),
                ));
    }
  }
}
