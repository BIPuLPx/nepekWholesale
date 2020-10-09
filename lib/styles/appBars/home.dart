import 'package:flutter/material.dart';
import 'package:skite_buyer/styles/colors.dart';

homeAppbar(context) {
  return PreferredSize(
    preferredSize: Size.fromHeight(50.0), // here the desired height
    child: AppBar(
      brightness: Brightness.light,
      backgroundColor: AppColors().transparentAppbar(),
      elevation: 1,
      title: Center(
        child: Image.asset(
          'icons/Brand.png',
          height: 16,
          color: AppColors().primaryBlue(),
        ),
      ),
      // backgroundColor: Colors.white,
      actions: [
        GestureDetector(
          onTap: () {
            // Navigator.pushReplacementNamed(context, 'result',
            //     arguments: {'type': 'search', 'query': 'iphone'});

            Navigator.pushNamed(context, 'search');
          },
          child: Container(
            margin: EdgeInsets.only(top: 10, bottom: 10, right: 20),
            padding: EdgeInsets.only(left: 5, right: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: AppColors().primaryBlue(),
                  spreadRadius: 0.002,
                  blurRadius: 0.4,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'What are you looking for ?',
                  style: TextStyle(
                    color: AppColors().searchBarItems(),
                    fontFamily: 'BalsamiqSans',
                    fontSize: 12,
                  ),
                ),
                Icon(Icons.search,
                    color: AppColors().searchBarItems(), size: 18)
              ],
            ),
            width: 220,
          ),
        )
      ],
    ),
  );
}
