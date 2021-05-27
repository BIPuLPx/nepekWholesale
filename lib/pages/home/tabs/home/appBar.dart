import 'package:flutter/material.dart';
import 'package:nepek_buyer/styles/text/normal_text.dart';

homeAppbar(context, bool darkTheme) {
  final deviceWidth = MediaQuery.of(context).size.width;
  // final bool darkTheme = Provider.of
  return PreferredSize(
    preferredSize: Size.fromHeight(65.0),
    child: AppBar(
      elevation: 0,
      leading: Container(
        margin: EdgeInsets.only(left: 20, bottom: 5),
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Image.asset(
          'assets/others/Brand.png',
          height: 13,
        ),
      ),
      // backgroundColor: Colors.white,
      title: GestureDetector(
        onTap: () {
          // Navigator.pushReplacementNamed(context, 'result',
          //     arguments: {'type': 'search', 'query': 'iphone'});

          Navigator.pushNamed(context, 'search');
        },
        child: Container(
          // width: deviceWidth * 0.9,
          height: 40,
          margin: EdgeInsets.only(left: 5),
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            border: Border.all(
              color: Colors.grey.shade300,
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 0,
                blurRadius: 2,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NepekText(
                'What are you looking for ?',
                fontSize: 14,
                color: Colors.grey,
              ),
              Icon(
                Icons.search,
                color: Colors.grey,
                size: 20,
              )
            ],
          ),
        ),
      ),
    ),
  );
}
