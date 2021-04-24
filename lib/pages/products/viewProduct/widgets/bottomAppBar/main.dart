import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_provider.dart';

import 'nested/add_to_cart.dart';

class ViewProductBottomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bool darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    final appBarColor = darkTheme ? Colors.black : Colors.white;
    return BottomAppBar(
        elevation: 2,
        child: Container(
          // color: appBarColor,
          padding: EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 5),
          child: AddToCart(),
        ));
  }
}
