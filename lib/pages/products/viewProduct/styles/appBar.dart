import 'package:flutter/material.dart';
import 'package:nepek_buyer/pages/products/viewProduct/view_product_state.dart';
import 'package:nepek_buyer/styles/text/normal_text.dart';
import 'package:nepek_buyer/styles/text/trimName.dart';
import 'package:provider/provider.dart';
import 'package:nepek_buyer/listeners/cart_no_listener.dart';
import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_provider.dart';

viewProductAppBar(viewProductContext) {
  final bool darktheme =
      Provider.of<DarkThemeProvider>(viewProductContext).darkTheme;

  Color itemColor = darktheme ? Colors.white : AppColors().officialMatch();
  final provider = Provider.of<ViewProductState>(viewProductContext);

  return SliverAppBar(
    title: NepekText(
      value: provider.screen == 1
          ? trimName(provider.productName, 10)
          : 'Select your variant',
      fontWeight: FontWeight.w500,
      color: AppColors().officialMatch(),
      fontSize: 18,
    ),
    centerTitle: false,
    leading: IconButton(
      onPressed: () {
        if (provider.screen == 1)
          Navigator.of(viewProductContext).pop();
        else
          provider.changeScreen(1);
      },
      icon: Icon(
        Icons.arrow_back_ios,
        color: itemColor,
        size: 21,
      ),
    ),
    floating: true,
    elevation: 5,
    // brightness: Brightness.light,
    actions: [
      IconButton(
          icon: Icon(
            Icons.favorite,
            color: provider.isWishListed() ? Colors.red : Colors.grey,
          ),
          onPressed: () {
            provider.toggleFav(viewProductContext);
          }),
      IconButton(
        icon: CartNoListener(
          icon: Image.asset(
            'assets/bottomNavBar/cartUnselected.png',
            height: 18,
            color: itemColor,
          ),
          labelColor: Colors.white,
          // iconColor: AppColors().officialMatch(),
        ),
        onPressed: () => Navigator.pushNamed(viewProductContext, 'cart'),
      ),
    ],
    // backgroundColor: Colors.white,
    // expandedHeight: 128.0,
  );
}
