import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:skite_buyer/iconsClass/bottom_nav_icons_icons.dart';
import 'package:skite_buyer/listeners/cart_no_listener.dart';
import 'package:skite_buyer/pages/home/tabs/cart/main.dart';
import 'package:skite_buyer/pages/home/tabs/categories/main.dart';
import 'package:skite_buyer/pages/home/tabs/home/main.dart';
import 'package:skite_buyer/pages/home/tabs/profile/main.dart';
import 'package:skite_buyer/styles/colors.dart';
import 'package:skite_buyer/styles/darkThemes/dark_theme_provider.dart';

import '../../styles/extensions.dart';
import '../userInfoInput/address/main.dart';
// import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomePageRoot();
  }
}

//HomePageRoot
class HomePageRoot extends StatefulWidget {
  // final int index;
  // HomePageRoot({this.index});
  @override
  _HomePageRootState createState() => _HomePageRootState();
}

class _HomePageRootState extends State<HomePageRoot> {
  int _currentIndex = 0;

  final tabs = [
    HomeTab(),
    Categories(),
    Profile(),
    CartTab(outside: false),
    // AddDeliveryAddress()
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = Provider.of<DarkThemeProvider>(context).darkTheme;
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        showSelectedLabels: false,
        unselectedLabelStyle: GoogleFonts.cabin(
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
          });
        },
      ),
    );
  }

  BottomNavigationBarItem _navItem(String label, bool isDark) {
    Image _selected(String label) => Image.asset(
          'assets/bottomNavBar/$label.png',
          height: 22,
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
              ? CartNoListener(icon: _selected(label))
              : _selected(label)),
      icon: label == 'cart'
          ? CartNoListener(icon: _unselected(label))
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
