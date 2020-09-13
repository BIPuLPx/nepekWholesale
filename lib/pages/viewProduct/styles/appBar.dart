import 'package:flutter/material.dart';
import 'package:skite_buyer/iconsClass/bottom_nav_icons_icons.dart';
import 'package:skite_buyer/styles/colors.dart';

viewProductAppBar(viewProductContext) {
  return SliverAppBar(
    leading: IconButton(
      onPressed: () => Navigator.of(viewProductContext).pop(),
      icon: Icon(
        Icons.arrow_back_ios,
        color: AppColors().primaryBlue(),
        size: 17,
      ),
    ),
    floating: true,
    elevation: 5,
    brightness: Brightness.light,
    actions: [
      IconButton(
        icon: Icon(
          BottomNavIcons.cart,
          color: AppColors().primaryBlue(),
          size: 19,
        ),
        onPressed: () => Navigator.pushNamed(viewProductContext, 'cart'),
      ),
    ],
    backgroundColor: Colors.white,
    // expandedHeight: 128.0,
  );
}
