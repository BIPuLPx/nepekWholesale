import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/functions/check_cart_products.dart';
import 'package:nepek_buyer/library/sync/account.dart';
import 'package:nepek_buyer/library/sync/delivery_addresses.dart';
import 'package:nepek_buyer/notifications/main.dart';
import 'package:provider/provider.dart';
import 'package:nepek_buyer/listeners/cart_no_listener.dart';
import 'package:nepek_buyer/pages/home/tabs/cart/main.dart';
import 'package:nepek_buyer/pages/home/tabs/categories/main.dart';
import 'package:nepek_buyer/pages/home/tabs/home/main.dart';
import 'package:nepek_buyer/pages/home/tabs/profile/main.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_provider.dart';
import '../../styles/extensions.dart';
// import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomePageRoot();
  }
}

//HomePageRoot
class HomePageRoot extends StatefulWidget {
  @override
  _HomePageRootState createState() => _HomePageRootState();
}

class _HomePageRootState extends State<HomePageRoot>
    with WidgetsBindingObserver {
  final SyncAccount _account = SyncAccount();

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      await _account.start();
      await SyncDeliveryAddresses().getMyDeliveryAddresses();
      await isCartItemsAvailable();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  int _currentIndex = 0;

  final tabs = [
    HomeTab(),
    Categories(),
    Profile(),
    CartTab(outside: false),
  ];
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final bool isDark = Provider.of<DarkThemeProvider>(context).darkTheme;
    return Notifications(
      child: Scaffold(
        body: PageView(
          //  physics: N(),
          physics: NeverScrollableScrollPhysics(),
          // physics: ClampingScrollPhysics(),
          controller: _pageController,
          children: tabs,
          onPageChanged: (page) {
            setState(() {
              _currentIndex = page;
              // print(page);
            });
          },
        ),

        // body: IndexedStack(
        //   index: _currentIndex,
        //   children: tabs,
        // ),

        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          backgroundColor: isDark ? Colors.black : Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 12,
          showSelectedLabels: false,
          unselectedLabelStyle: GoogleFonts.poppins(
            height: 1.7,
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: isDark ? Colors.white60 : Colors.black54,
          ),
          currentIndex: _currentIndex,
          items: [
            _navItem('home', isDark),
            _navItem('categories', isDark),
            _navItem('profile', isDark),
            _navItem('cart', isDark),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              // print(index);
            });
            _pageController.jumpToPage(index);
          },
        ),
      ),
    );
  }

  BottomNavigationBarItem _navItem(String label, bool isDark) {
    _selected(String label) => Container(
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(20),
          //   border: Border.all(
          //     color: AppColors.officialMatchThird,
          //     width: 2,
          //   ),
          // ),
          // padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          child: Image.asset(
            'assets/bottomNavBar/$label.png',
            height: 22,
          ),
        );

    Image _unselected(String label) => Image.asset(
          'assets/bottomNavBar/${label}Unselected.png',
          height: 18,
          color: isDark ? Colors.white60 : Colors.black54,
        );

    return BottomNavigationBarItem(
      label: capitalize(label),
      activeIcon: Container(
          margin: EdgeInsets.only(top: 7),
          child: label == 'cart'
              ? CartNoListener(
                  icon: _selected(label),
                  labelColor: Colors.white,
                )
              : _selected(label)),
      icon: label == 'cart'
          ? CartNoListener(
              icon: _unselected(label),
              labelColor: Colors.white,
            )
          : _unselected(label),
    );
  }
}

class TextContainer extends StatelessWidget {
  final child;
  TextContainer({this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 3,
      ),
      child: Text(
        child,
        style: TextStyle(fontSize: 12, fontFamily: 'BalsamiqSans'),
      ),
    );
  }
}
