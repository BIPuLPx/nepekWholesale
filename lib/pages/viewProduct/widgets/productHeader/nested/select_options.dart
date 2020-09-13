import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> lst = ['android', 'kotlin', 'flutter'];
  int selectedIndex = 0;

  List<IconData> iconList = [
    Icons.settings,
    Icons.bookmark,
    Icons.account_circle
  ];
  int secondaryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          customRadio(lst[0], 0),
          customRadio(lst[1], 1),
          customRadio(lst[2], 2),
          SizedBox(
            height: 30.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              customRadio2(iconList[0], 0),
              customRadio2(iconList[1], 1),
              customRadio2(iconList[2], 2),
            ],
          )
        ],
      ),
    );
  }

  void changeIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Widget customRadio(String txt, int index) {
    return OutlineButton(
      onPressed: () => changeIndex(index),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      borderSide:
          BorderSide(color: selectedIndex == index ? Colors.cyan : Colors.grey),
      child: Text(
        txt,
        style: TextStyle(
            color: selectedIndex == index ? Colors.cyan : Colors.grey),
      ),
    );
  }

  void changeSecondaryIndex(int index) {
    setState(() {
      secondaryIndex = index;
    });
  }

  Widget customRadio2(IconData icon, int index) {
    return OutlineButton(
      onPressed: () => changeSecondaryIndex(index),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      borderSide: BorderSide(
          color: secondaryIndex == index
              ? Colors.deepOrangeAccent[700]
              : Colors.grey),
      child: Icon(
        icon,
        color: secondaryIndex == index ? Colors.deepOrangeAccent : Colors.grey,
      ),
    );
  }
}
