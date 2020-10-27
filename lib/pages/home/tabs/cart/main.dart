import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skite_buyer/pages/home/tabs/cart/cart_state.dart';
import 'package:skite_buyer/styles/appBars/default_app_bar.dart';
import 'package:skite_buyer/styles/darkThemes/dark_theme_provider.dart';

class CartTab extends StatelessWidget {
  final bool outside;
  CartTab({this.outside});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CartState>(
      create: (context) => CartState(),
      child: CartRoot(outside: outside),
    );
  }
}

class CartRoot extends StatefulWidget {
  final bool outside;
  CartRoot({this.outside});

  @override
  _CartRootState createState() => _CartRootState();
}

class _CartRootState extends State<CartRoot> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartState>(context);
    final bool darktheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    if (cart.initialgetCart == false) {
      cart.getAllcartItems();
      cart.initialgetCart = true;
    }
    return Scaffold(
      appBar: widget.outside == true
          ? defaultAppBar(context, 'Cart', darktheme)
          : null,
      body: SafeArea(child: cart.body),
    );
  }
}
