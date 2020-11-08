import 'package:flutter/material.dart';
import 'package:nepek_buyer/pages/account/main.dart';
import 'package:nepek_buyer/pages/ask_a_question/main.dart';
import 'package:nepek_buyer/pages/carasoulLanding/main.dart';
import 'package:nepek_buyer/pages/confirmOrder/main.dart';
import 'package:nepek_buyer/pages/myquestions/main.dart';
import 'package:nepek_buyer/pages/payment_methods/main.dart';
import 'package:nepek_buyer/pages/checkout/main.dart';
import 'package:nepek_buyer/pages/continueEmail/main.dart';
import 'package:nepek_buyer/pages/featuredBrandLanding/main.dart';
import 'package:nepek_buyer/pages/filter/main.dart';
import 'package:nepek_buyer/pages/filter/subPages/brand/main.dart';
import 'package:nepek_buyer/pages/filter/subPages/price/main.dart';
import 'package:nepek_buyer/pages/filter/subPages/specifications/main.dart';
import 'package:nepek_buyer/pages/home/tabs/profile/main.dart';
import 'package:nepek_buyer/pages/qnas/main.dart';
import 'package:nepek_buyer/pages/result/main.dart';
import 'package:nepek_buyer/pages/reviews/main.dart';
import 'package:nepek_buyer/pages/search/main.dart';
import 'package:nepek_buyer/pages/home/main.dart';
import 'package:nepek_buyer/pages/home/tabs/cart/main.dart';
import 'package:nepek_buyer/pages/signupWithEmail/main.dart';
import 'package:nepek_buyer/pages/userInfoInput/address/main.dart';
import 'package:nepek_buyer/pages/userInfoInput/phoneNumber/main.dart';
import 'package:nepek_buyer/pages/viewProduct/main.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    //CAN ACCESS OBJECT
    final args = settings.arguments;

    switch (settings.name) {
      case 'home':
        return MaterialPageRoute(builder: (_) => HomePage());

      case 'profile':
        return MaterialPageRoute(builder: (_) => Profile(args: args));

      case 'my_questions':
        return MaterialPageRoute(builder: (_) => MyQuestions());

      case 'continue_with_email':
        return MaterialPageRoute(builder: (_) => ContinueWithEmail(args: args));

      case 'sign_up_with_email':
        return MaterialPageRoute(builder: (_) => SignUpWithEmail());

      case 'search':
        return MaterialPageRoute(builder: (_) => SearchPage());

      case 'result':
        return MaterialPageRoute(builder: (_) => ResultPage(args: args));

      case 'filter_result':
        return MaterialPageRoute(builder: (_) => FilterPage(args: args));

      case 'filter_price':
        return MaterialPageRoute(builder: (_) => FilterPricePage(args: args));

      case 'filter_brands':
        return MaterialPageRoute(builder: (_) => FilterBrandsPage(args: args));

      case 'filter_options':
        return MaterialPageRoute(
            builder: (_) => FilterSpecificationsPage(args: args));

      case 'view_product':
        return MaterialPageRoute(
          settings: RouteSettings(name: "view_product"),
          builder: (_) => ViewProductPage(args: args),
        );

      case 'cart':
        return MaterialPageRoute(builder: (_) => CartTab(outside: true));

      case 'input_phone_number':
        return MaterialPageRoute(builder: (_) => VerifyPhoneNumber(args: args));

      case 'input_delivery_address':
        return MaterialPageRoute(
            builder: (_) => AddDeliveryAddress(args: args));

      case 'account':
        return MaterialPageRoute(builder: (_) => AccountPage(args: args));

      case 'reviews':
        return MaterialPageRoute(builder: (_) => ReviewsPage(args: args));

      case 'qnas':
        return MaterialPageRoute(builder: (_) => QnaPage(args: args));

      case 'ask_a_qsn':
        return MaterialPageRoute(builder: (_) => AskaQuestion(args: args));

      case 'carasoul_landing':
        return MaterialPageRoute(builder: (_) => CarasoulLanding(args: args));

      case 'featured_brand_landing':
        return MaterialPageRoute(
            builder: (_) => FeaturedBrandLanding(args: args));

      case 'checkout':
        return MaterialPageRoute(builder: (_) => Checkout(args: args));

      case 'payment_method':
        return MaterialPageRoute(
          settings: RouteSettings(name: "payment_method"),
          builder: (_) => PaymentMethods(args: args),
        );

      case 'order_now':
        return MaterialPageRoute(builder: (_) => OrderDetails(args: args));

      default:
        return MaterialPageRoute(
          settings: RouteSettings(name: "home"),
          builder: (_) => HomePage(),
        );
    }
  }
}
