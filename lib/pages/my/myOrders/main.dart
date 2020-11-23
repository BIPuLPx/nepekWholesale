import 'package:flutter/material.dart';
import 'package:nepek_buyer/styles/appBars/default_app_bar.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_provider.dart';
import 'package:provider/provider.dart';
import 'my_orders_provider.dart';


class MyOrdersRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MyOrdersProvider provider = Provider.of(context);
    final bool darktheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    if (provider.initFetch == false) {
      provider.getOrders();
    }

    return Scaffold(
      appBar: defaultAppBar(context, 'My Orders', darktheme),
      body: provider.body,
    );
  }
}

class MyOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyOrdersProvider(),
      child: MyOrdersRoot(),
    );
  }
}
