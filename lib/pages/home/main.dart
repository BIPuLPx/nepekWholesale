import 'package:flutter/material.dart';
import 'package:skite_buyer/iconsClass/bottom_nav_icons_icons.dart';
import 'package:skite_buyer/pages/home/tabs/cart/main.dart';
import 'package:skite_buyer/pages/home/tabs/home/main.dart';
import 'package:skite_buyer/styles/colors.dart';
// import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

//Homepage
class HomePage extends StatefulWidget {
  final int index;
  HomePage({this.index});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final tabs = [
    HomeTab(),
    Text('Catrgories'),
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
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //     statusBarColor: Colors.white,
    //     // statusBarBrightness: Brightness.light,
    //     statusBarIconBrightness: Brightness.dark,
    //     systemNavigationBarColor: Colors.white));
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
            icon: Icon(
              BottomNavIcons.cart,
              size: 18,
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
