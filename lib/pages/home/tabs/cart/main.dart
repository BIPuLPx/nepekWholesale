import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:skite_buyer/pages/home/tabs/cart/appBar.dart';
import 'package:skite_buyer/pages/home/tabs/cart/cart_state.dart';
import 'package:skite_buyer/pages/home/tabs/cart/widgets/bottomAppBar/bottomAppbar.dart';
import 'package:skite_buyer/pages/home/tabs/cart/widgets/emptyCart/empty_cart.dart';
import 'package:skite_buyer/styles/colors.dart';
import 'package:skite_buyer/styles/font_styles.dart';

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
    if (cart.initialgetCart == false) {
      cart.getAllcartItems();
    }

    return Scaffold(
      appBar: widget.outside == true ? cartAppBar(context) : null,
      body: SafeArea(child: cart.body),
    );
  }
}
