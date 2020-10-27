import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skite_buyer/listeners/cart_no_listener.dart';
import 'package:skite_buyer/styles/colors.dart';
import 'package:skite_buyer/styles/darkThemes/dark_theme_provider.dart';

viewProductAppBar(viewProductContext) {
  final bool darktheme =
      Provider.of<DarkThemeProvider>(viewProductContext).darkTheme;

  Color itemColor = darktheme ? Colors.white : AppColors().primaryBlue();

  return SliverAppBar(
    leading: IconButton(
      onPressed: () => Navigator.of(viewProductContext).pop(),
      icon: Icon(
        Icons.arrow_back_ios,
        color: itemColor,
        size: 17,
      ),
    ),
    floating: true,
    elevation: 5,
    // brightness: Brightness.light,
    actions: [
      IconButton(icon: Icon(Icons.favorite_border), onPressed: () {}),
      IconButton(
        icon: CartNoListener(
          icon: Image.asset(
            'assets/bottomNavBar/cartUnselected.png',
            height: 18,
            color: itemColor,
          ),
          labelColor: Colors.white,
          // iconColor: AppColors().primaryBlue(),
        ),
        onPressed: () => Navigator.pushNamed(viewProductContext, 'cart'),
      ),
    ],
    // backgroundColor: Colors.white,
    // expandedHeight: 128.0,
  );
}
