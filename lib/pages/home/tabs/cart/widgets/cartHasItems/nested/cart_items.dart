import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nepek_buyer/pages/home/tabs/cart/cart_state.dart';
import 'package:nepek_buyer/pages/home/tabs/cart/widgets/cartHasItems/nested/cartItemLayout/main.dart';

class CartItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartState>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: cart.cartItems
          .map(
            (item) => CartItemLayout(item: item),
          )
          .toList(),
    );
  }
}
