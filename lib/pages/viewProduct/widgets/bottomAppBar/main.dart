import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skite_buyer/pages/viewProduct/widgets/bottomAppBar/nested/add_to_cart.dart';
import 'package:skite_buyer/styles/darkThemes/dark_theme_provider.dart';

class ViewProductBottomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bool darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    final appBarColor = darkTheme ? Colors.black : Colors.white;
    return BottomAppBar(
        child: Container(
      color: appBarColor,
      padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      child: AddToCart(),
    ));
  }
}
