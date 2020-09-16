import 'package:flutter/material.dart';
import 'package:skite_buyer/pages/home/tabs/cart/widgets/bottomAppBar/bottomAppbar.dart';
import 'package:skite_buyer/pages/home/tabs/cart/widgets/cartHasItems/nested/cart_items.dart';

class CartHasItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[200],
        child: ListView(
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          children: [
            CartItems(),
          ],
        ),
      ),
      bottomNavigationBar: CartBottomNavBar(),
    );
  }
}
