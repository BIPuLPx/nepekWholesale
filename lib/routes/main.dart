import 'package:flutter/material.dart';
import 'package:skite_buyer/pages/account/main.dart';
import 'package:skite_buyer/pages/carasoulLanding/main.dart';
import 'package:skite_buyer/pages/featuredBrandLanding/main.dart';
import 'package:skite_buyer/pages/reviews/main.dart';
import 'package:skite_buyer/pages/search/main.dart';
import 'package:skite_buyer/pages/searchResult/filter/main.dart';
import 'package:skite_buyer/pages/searchResult/filter/subPages/brand/main.dart';
import 'package:skite_buyer/pages/home/main.dart';
import 'package:skite_buyer/pages/home/tabs/cart/main.dart';
import 'package:skite_buyer/pages/searchResult/filter/subPages/options/main.dart';
import 'package:skite_buyer/pages/searchResult/filter/subPages/price/main.dart';
import 'package:skite_buyer/pages/searchResult/main.dart';
import 'package:skite_buyer/pages/userInfoInput/address/main.dart';
import 'package:skite_buyer/pages/userInfoInput/phoneNumber/main.dart';
import 'package:skite_buyer/pages/viewProduct/main.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    //CAN ACCESS OBJECT
    final args = settings.arguments;

    switch (settings.name) {
      case 'home':
        return MaterialPageRoute(builder: (_) => HomePage());

      case 'search':
        return MaterialPageRoute(builder: (_) => SearchPage());
      // return MaterialPageRoute(
      //     builder: (_) => ViewProductPage(
      //           args: {
      //             'product_id': '5f5f21abaea4a6058cb46fcd',
      //             'product_uid': 'hc38ozkbfipgrwso7t9mec50w'
      //           },
      //         ));

      case 'result':
        return MaterialPageRoute(builder: (_) => ResultPage(args: args));

      case 'filter_search_result':
        return MaterialPageRoute(builder: (_) => SearchFilterPage(args: args));

      case 'filter_price':
        return MaterialPageRoute(builder: (_) => FilterPricePage(args: args));

      case 'filter_brands':
        return MaterialPageRoute(builder: (_) => FilterBrandsPage(args: args));

      case 'filter_options':
        return MaterialPageRoute(builder: (_) => FilterOptionsPage(args: args));

      case 'view_product':
        return MaterialPageRoute(builder: (_) => ViewProductPage(args: args));

      case 'cart':
        return MaterialPageRoute(builder: (_) => CartTab(outside: true));

      case 'input_phone_number':
        return MaterialPageRoute(builder: (_) => VerifyPhoneNumber(args: args));

      case 'input_delivery_address':
        return MaterialPageRoute(builder: (_) => AddDeliveryAddress());

      case 'account':
        return MaterialPageRoute(builder: (_) => AccountPage(args: args));

      case 'reviews':
        return MaterialPageRoute(builder: (_) => ReviewsPage(args: args));

      case 'carasoul_landing':
        return MaterialPageRoute(builder: (_) => CarasoulLanding(args: args));

      case 'featured_brand_landing':
        return MaterialPageRoute(
            builder: (_) => FeaturedBrandLanding(args: args));

      default:
        // return
        // MaterialPageRoute(
        // builder: (_) => UserPreferences().getLoggedIn() == true
        //     ? HomePage()
        //     : DoYouHaveAccount());
        return MaterialPageRoute(builder: (_) => HomePage());
      // return MaterialPageRoute(
      //     builder: (_) =>
      //         ReviewsPage(args: {'id': '5f5f21abaea4a6058cb46fcd'}));

      // return MaterialPageRoute(builder: (_) => AddDeliveryAddress());
      // return MaterialPageRoute(
      // builder: (_) => Scaffold(body: SafeArea(child: SignedIn())));

      // return MaterialPageRoute(builder: (_) => VerifyPhoneNumber());

      // return MaterialPageRoute(
      //     builder: (_) => ViewProductPage(
      //           args: {
      //             'product_id': '5f5f21abaea4a6058cb46fcd',
      //             'product_uid': 'hc38ozkbfipgrwso7t9mec50w'
      //           },
      //         ));

      // return MaterialPageRoute(builder: (_) => SliverTest());
    }
  }
}
