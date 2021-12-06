import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/functions/check_cart_products.dart';
import 'package:nepek_buyer/library/sync/account.dart';
import 'package:nepek_buyer/library/sync/delivery_addresses.dart';
import 'package:nepek_buyer/notifications/main.dart';
import 'package:nepek_buyer/savedData/user_data.dart';
import 'package:nepek_buyer/styles/colors.dart';
import 'package:provider/provider.dart';
import 'package:nepek_buyer/pages/home/tabs/home/main.dart';
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
    Container(),
    Container(),
    Container(),
    Container(),

    // Categories(),
    // Profile(),
    // CartTab(outside: false),
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
            // if (_currentIndex == 3) {
            // } else
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
          // selectedFontSize: 12,
          showSelectedLabels: true,
          selectedItemColor: AppColors.officialMatch,
          unselectedItemColor: Colors.black54,
          // showUnselectedLabels: false,
          unselectedLabelStyle: GoogleFonts.poppins(
            height: 1.7,
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Colors.black54,
          ),
          selectedLabelStyle: GoogleFonts.poppins(
            height: 1.7,
            fontSize: 12,
            fontWeight: FontWeight.w600,
            // color: Colors.black,
          ),
          currentIndex: _currentIndex,
          items: [
            _navItem('home', isDark),
            _navItem('favorites', isDark),
            _navItem('add', isDark),
            _navItem('chat', isDark),
            _navItem('profile', isDark),
          ],
          onTap: (index) {
            if (index == 2) {
              final bool isLoggedIn = UserPreferences().getLoggedIn();
              if (isLoggedIn == true)
                Navigator.pushNamed(context, 'add_listing');
              else
                Navigator.pushNamed(
                  context,
                  'continue_with_email',
                  arguments: {
                    'thirdPartyRoute': 'add_listing',
                    'refresh': () {},
                  },
                );
            } else {
              setState(() {
                _currentIndex = index;
                // print(index);
              });
              _pageController.jumpToPage(index);
            }
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
            height: 20,
          ),
        );

    Image _unselected(String label) => Image.asset(
          'assets/bottomNavBar/${label}Unselected.png',
          height: 18,
          color: isDark ? Colors.white60 : Colors.black54,
        );

    if (label == 'add') {
      return BottomNavigationBarItem(
        label: '',
        icon: Container(
          margin: EdgeInsets.only(top: 8),
          child: Image.asset(
            'assets/bottomNavBar/$label.png',
            height: 23,
            // color: isDark ? Colors.white60 : Colors.black54,
          ),
        ),
      );
    }

    return BottomNavigationBarItem(
      label: capitalize(label),
      activeIcon:
          // ÷ Container(
          // margin: EdgeInsets.only(top: 7),
          // child:
          _selected(label),
      // ),
      icon: _unselected(label),
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
