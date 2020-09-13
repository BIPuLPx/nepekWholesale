import 'package:flutter/material.dart';
import 'package:skite_buyer/pages/home/tabs/cart/empty_cart.dart';
import 'package:skite_buyer/styles/appBars/cart.dart';

class CartTab extends StatelessWidget {
  final bool outside;
  CartTab({this.outside});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: outside == true ? cartAppBar(context) : null,
      body: SafeArea(
        child: EmptyCart(),
      ),
    );
  }
}
