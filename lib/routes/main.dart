import 'package:flutter/material.dart';
import 'package:nepek_buyer/pages/buy/checkout/main.dart';
import 'package:nepek_buyer/pages/buy/order_details/main.dart';
import 'package:nepek_buyer/pages/buy/payment_methods/main.dart';
import 'package:nepek_buyer/pages/carasoulLanding/main.dart';
import 'package:nepek_buyer/pages/featuredBrandLanding/main.dart';
import 'package:nepek_buyer/pages/home/main.dart';
import 'package:nepek_buyer/pages/home/tabs/profile/main.dart';
import 'package:nepek_buyer/pages/home/tabs/cart/main.dart';
import 'package:nepek_buyer/pages/my/address_book/main.dart';
import 'package:nepek_buyer/pages/my/myOrders/main.dart';
import 'package:nepek_buyer/pages/my/myOrders/viewOrder/main.dart';
import 'package:nepek_buyer/pages/my/myWishLists/main.dart';
import 'package:nepek_buyer/pages/my/myaccount/main.dart';
import 'package:nepek_buyer/pages/my/myquestions/main.dart';
import 'package:nepek_buyer/pages/products/ask_a_question/main.dart';
import 'package:nepek_buyer/pages/products/filter/main.dart';
import 'package:nepek_buyer/pages/products/filter/subPages/brand/main.dart';
import 'package:nepek_buyer/pages/products/filter/subPages/price/main.dart';
import 'package:nepek_buyer/pages/products/filter/subPages/specifications/main.dart';
import 'package:nepek_buyer/pages/products/qnas/main.dart';
import 'package:nepek_buyer/pages/products/result/main.dart';
import 'package:nepek_buyer/pages/products/reviews/main.dart';
import 'package:nepek_buyer/pages/products/search/main.dart';
import 'package:nepek_buyer/pages/products/viewProduct/main.dart';
import 'package:nepek_buyer/pages/products/viewProduct/widgets/view_image/main.dart';
import 'package:nepek_buyer/pages/seller_store/main.dart';
import 'package:nepek_buyer/pages/userData/continueEmail/main.dart';
import 'package:nepek_buyer/pages/userData/signupWithEmail/main.dart';
import 'package:nepek_buyer/pages/userData/userInfoInput/address/main.dart';
import 'package:nepek_buyer/pages/userData/userInfoInput/phoneNumber/main.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    //CAN ACCESS OBJECT
    final args = settings.arguments;

    switch (settings.name) {
      case 'home':
        return MaterialPageRoute(
          settings: RouteSettings(name: "home"),
          builder: (_) => HomePage(),
        );

      case 'profile':
        return MaterialPageRoute(builder: (_) => Profile(args: args));

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

      case 'view_image':
        return MaterialPageRoute(builder: (_) => ViewImageFull(args: args));

      case 'cart':
        return MaterialPageRoute(builder: (_) => CartTab(outside: true));

      case 'input_phone_number':
        return MaterialPageRoute(builder: (_) => VerifyPhoneNumber(args: args));

      case 'input_delivery_address':
        return MaterialPageRoute(
            builder: (_) => AddDeliveryAddress(args: args));

      //MY
      case 'account':
        return MaterialPageRoute(builder: (_) => AccountPage(args: args));

      case 'address_book':
        return MaterialPageRoute(builder: (_) => AddressBook(refresh: args));

      case 'my_questions':
        return MaterialPageRoute(builder: (_) => MyQuestions());

      case 'my_orders':
        return MaterialPageRoute(builder: (_) => MyOrders());

      case 'my_wishlists':
        return MaterialPageRoute(builder: (_) => MyWishLists());

      case 'view_order':
        return MaterialPageRoute(builder: (_) => ViewOrder(args: args));

      //Products
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

      case 'order_details':
        return MaterialPageRoute(builder: (_) => OrderDetails(args: args));

      default:
        // return MaterialPageRoute(builder: (_) => SellerStore());

        return MaterialPageRoute(
          settings: RouteSettings(name: "home"),
          builder: (_) => HomePage(),
        );
    }
  }
}
