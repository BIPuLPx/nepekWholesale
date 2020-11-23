import 'package:flutter/material.dart';
import 'package:nepek_buyer/pages/my/myWishLists/wishlists_provider.dart';
import 'package:nepek_buyer/styles/appBars/default_app_bar.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class MyWishLists extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WishListsProvider(),
      child: MyWishListsRoot(),
    );
  }
}

class MyWishListsRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final WishListsProvider provider = Provider.of(context);
    final bool darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;

    if (!provider.initFetched) {
      provider.getMyWishLists();
    }

    return Scaffold(
      appBar: defaultAppBar(context, 'My Wishlists', darkTheme),
      body: provider.body,
    );
  }
}
