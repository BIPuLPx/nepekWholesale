import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:skite_buyer/iconsClass/bottom_nav_icons_icons.dart';
import 'package:skite_buyer/listeners/cart_no_listener.dart';
import 'package:skite_buyer/pages/home/tabs/cart/main.dart';
import 'package:skite_buyer/pages/home/tabs/categories/main.dart';
import 'package:skite_buyer/pages/home/tabs/home/main.dart';
import 'package:skite_buyer/styles/colors.dart';
// import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Hive.openBox('cart'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError)
            return Text(snapshot.error.toString());
          else
            return HomePageRoot(index: 1);
        }
        // Although opening a Box takes a very short time,
        // we still need to return something before the Future completes.
        else
          return Scaffold();
      },
    );
  }
}

//HomePageRoot
class HomePageRoot extends StatefulWidget {
  final int index;
  HomePageRoot({this.index});
  @override
  _HomePageRootState createState() => _HomePageRootState();
}

class _HomePageRootState extends State<HomePageRoot> {
  int _currentIndex;

  final tabs = [
    HomeTab(),
    Categories(),
    Text('Profile'),
    CartTab(outside: false)
  ];
  @override
  void initState() {
    super.initState();
    setState(() {
      _currentIndex = widget.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        // elevation: 60,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        // selectedIconTheme: IconThemeData(color: Colors.blue, size: 10),
        selectedItemColor: AppColors().primaryBlue(),
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                BottomNavIcons.home,
                size: 18,
              ),
              title: TextContainer(child: 'Home')),
          BottomNavigationBarItem(
              icon: Icon(
                BottomNavIcons.categories,
                size: 18,
              ),
              title: TextContainer(child: ' Categories')),
          BottomNavigationBarItem(
              icon: Icon(
                BottomNavIcons.profile,
                size: 18,
              ),
              title: TextContainer(child: 'Profile')),
          BottomNavigationBarItem(
            icon: CartNoListener(
              size: 18,
              labelColor: Colors.white,
            ),
            title: TextContainer(child: '  Cart'),
          ),
          // BottomNavigationBarItem(
          //     icon: Icon(
          //       Icons.satellite,
          //       size: 22,
          //     ),
          //     title: Text('')),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
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
