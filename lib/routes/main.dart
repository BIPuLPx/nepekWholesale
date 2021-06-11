import 'package:flutter/material.dart';
import 'package:nepek_buyer/internet_checker/main.dart';
import 'package:page_transition/page_transition.dart';
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
import 'package:nepek_buyer/pages/my/myquestions/subpages/viewQna/main.dart';
import 'package:nepek_buyer/pages/my/returns/main.dart';
import 'package:nepek_buyer/pages/my/returns/subpages/eliglible_returns/main.dart';
import 'package:nepek_buyer/pages/my/to_review/main.dart';
import 'package:nepek_buyer/pages/products/ask_a_question/main.dart';
import 'package:nepek_buyer/pages/products/filter/main.dart';
import 'package:nepek_buyer/pages/products/filter/subPages/brand/main.dart';
import 'package:nepek_buyer/pages/products/filter/subPages/price/main.dart';
import 'package:nepek_buyer/pages/products/filter/subPages/specifications/main.dart';
import 'package:nepek_buyer/pages/products/give_review/main.dart';
import 'package:nepek_buyer/pages/products/qnas/main.dart';
import 'package:nepek_buyer/pages/products/result/main.dart';
import 'package:nepek_buyer/pages/products/reviews/main.dart';
import 'package:nepek_buyer/pages/products/search/main.dart';
import 'package:nepek_buyer/pages/products/viewProduct/main.dart';
import 'package:nepek_buyer/pages/products/viewProduct/widgets/view_image/main.dart';
import 'package:nepek_buyer/pages/userData/continueEmail/main.dart';
import 'package:nepek_buyer/pages/userData/signupWithEmail/main.dart';
import 'package:nepek_buyer/pages/userData/userInfoInput/address/main.dart';
import 'package:nepek_buyer/pages/userData/userInfoInput/phoneNumber/main.dart';
import 'package:nepek_buyer/styles/webview/main.dart';

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
        return PageTransition(
          child: Profile(args: args),
          type: PageTransitionType.bottomToTop,
        );

      case 'continue_with_email':
        return MaterialPageRoute(
          builder: (_) => InternetChecker(
            child: ContinueWithEmail(args: args),
          ),
        );

      case 'sign_up_with_email':
        return PageTransition(
          child: InternetChecker(
            child: SignUpWithEmail(),
          ),
          type: PageTransitionType.topToBottom,
        );

      case 'search':
        return PageTransition(
          child: InternetChecker(
            child: SearchPage(),
          ),
          type: PageTransitionType.rightToLeft,
        );

      case 'result':
        return PageTransition(
          child: InternetChecker(
            child: ResultPage(args: args),
          ),
          type: PageTransitionType.rightToLeft,
        );

      case 'filter_result':
        return PageTransition(
          child: InternetChecker(
            child: FilterPage(args: args),
          ),
          type: PageTransitionType.topToBottom,
        );

      case 'filter_price':
        return PageTransition(
          child: InternetChecker(
            child: FilterPricePage(args: args),
          ),
          type: PageTransitionType.bottomToTop,
        );

      case 'filter_brands':
        return PageTransition(
          child: InternetChecker(
            child: FilterBrandsPage(args: args),
          ),
          type: PageTransitionType.bottomToTop,
        );

      case 'filter_options':
        return PageTransition(
          child: InternetChecker(
            child: FilterSpecificationsPage(args: args),
          ),
          type: PageTransitionType.bottomToTop,
        );

      case 'view_product':
        return PageTransition(
          child: InternetChecker(
            child: ViewProductPage(args: args),
          ),
          type: PageTransitionType.rightToLeft,
        );

      case 'view_image':
        return PageTransition(
          child: InternetChecker(
            child: ViewImageFull(args: args),
          ),
          type: PageTransitionType.rightToLeft,
        );

      case 'cart':
        return PageTransition(
          child: InternetChecker(
            child: CartTab(outside: true),
          ),
          type: PageTransitionType.rightToLeft,
        );

      case 'input_phone_number':
        return MaterialPageRoute(builder: (_) => VerifyPhoneNumber(args: args));

      case 'input_delivery_address':
        return PageTransition(
          child: InternetChecker(
            child: AddDeliveryAddress(args: args),
          ),
          type: PageTransitionType.rightToLeft,
        );

      //MY
      case 'account':
        return PageTransition(
          child: InternetChecker(
            child: AccountPage(args: args),
          ),
          type: PageTransitionType.bottomToTop,
        );

      case 'address_book':
        return PageTransition(
          child: InternetChecker(
            child: AddressBook(refresh: args),
          ),
          type: PageTransitionType.rightToLeft,
        );

      case 'my_questions':
        return PageTransition(
          child: InternetChecker(
            child: MyQuestions(),
          ),
          type: PageTransitionType.bottomToTop,
        );

      case 'view_qna':
        return PageTransition(
          child: InternetChecker(
            child: ViewQna(id: args),
          ),
          type: PageTransitionType.rightToLeft,
        );

      case 'my_orders':
        return PageTransition(
          child: InternetChecker(
            child: MyOrders(),
          ),
          type: PageTransitionType.bottomToTop,
        );

      case 'to_review':
        return PageTransition(
          child: InternetChecker(
            child: ToReview(),
          ),
          type: PageTransitionType.bottomToTop,
        );

      case 'give_review':
        return PageTransition(
          child: InternetChecker(
            child: GiveReview(args: args),
          ),
          type: PageTransitionType.rightToLeft,
        );

      case 'my_wishlists':
        return PageTransition(
          child: InternetChecker(
            child: MyWishLists(),
          ),
          type: PageTransitionType.bottomToTop,
        );
      // return MaterialPageRoute(builder: (_) => MyWishLists());

      case 'view_order':
        return PageTransition(
          child: InternetChecker(
            child: ViewOrder(args: args),
          ),
          type: PageTransitionType.rightToLeft,
        );

      case 'my_returns':
        return PageTransition(
          child: InternetChecker(
            child: Returns(),
          ),
          type: PageTransitionType.bottomToTop,
        );

      case 'eligible_returns':
        return PageTransition(
          child: InternetChecker(
            child: EligibleReturns(args: args),
          ),
          type: PageTransitionType.rightToLeft,
        );

      //Products
      case 'reviews':
        return PageTransition(
          child: InternetChecker(
            child: ReviewsPage(args: args),
          ),
          type: PageTransitionType.rightToLeft,
        );

      case 'qnas':
        return PageTransition(
          child: InternetChecker(
            child: QnaPage(args: args),
          ),
          type: PageTransitionType.rightToLeft,
        );

      case 'ask_a_qsn':
        return PageTransition(
          child: InternetChecker(
            child: AskaQuestion(args: args),
          ),
          type: PageTransitionType.rightToLeft,
        );

      case 'carasoul_landing':
        return MaterialPageRoute(builder: (_) => CarasoulLanding(args: args));

      case 'featured_brand_landing':
        return MaterialPageRoute(
            builder: (_) => FeaturedBrandLanding(args: args));

      case 'checkout':
        return PageTransition(
          child: InternetChecker(
            child: Checkout(args: args),
          ),
          type: PageTransitionType.rightToLeft,
        );

      case 'payment_method':
        return PageTransition(
          child: InternetChecker(
            child: PaymentMethods(args: args),
          ),
          settings: RouteSettings(name: "payment_method"),
          type: PageTransitionType.rightToLeft,
        );

      case 'order_details':
        return PageTransition(
          child: InternetChecker(
            child: OrderDetails(args: args),
          ),
          type: PageTransitionType.rightToLeft,
        );

      case 'webview':
        return PageTransition(
          child: InternetChecker(
            child: NepekWebView(args: args),
          ),
          type: PageTransitionType.rightToLeft,
        );

      default:
        // return MaterialPageRoute(builder: (_) => SellerStore());

        return MaterialPageRoute(
          settings: RouteSettings(name: "home"),
          builder: (_) => InternetChecker(
            child: HomePage(),
          ),
        );
    }
  }
}
