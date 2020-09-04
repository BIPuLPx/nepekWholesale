import 'package:flutter/material.dart';
import 'package:skite_buyer/pages/filter/main.dart';
import 'package:skite_buyer/pages/filter/subPages/filterPrice.dart';
import 'package:skite_buyer/pages/home/main.dart';
import 'package:skite_buyer/pages/home/tabs/cart/main.dart';
import 'package:skite_buyer/pages/result/main.dart';
import 'package:skite_buyer/pages/search/main.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    //CAN ACCESS OBJECT
    final args = settings.arguments;

    switch (settings.name) {
      case 'home':
        return MaterialPageRoute(builder: (_) => HomePage(index: args));
      case 'search':
        return MaterialPageRoute(builder: (_) => SearchPage());
      case 'result':
        return MaterialPageRoute(builder: (_) => ResultPage(args: args));
      case 'filter_result':
        return MaterialPageRoute(builder: (_) => FilterPage());

      case 'filter_price':
        return MaterialPageRoute(builder: (_) => FilterPrice());

      case 'cart':
        return MaterialPageRoute(builder: (_) => CartTab(outside: true));

      default:
        // return
        // MaterialPageRoute(
        // builder: (_) => UserPreferences().getLoggedIn() == true
        //     ? HomePage()
        //     : DoYouHaveAccount());
        return MaterialPageRoute(builder: (_) => HomePage(index: 0));
      // return MaterialPageRoute(builder: (_) => SliverTest());
    }
  }
}
