import 'package:flutter/material.dart';
import 'package:nepek_buyer/pages/home/tabs/cart/widgets/bottomAppBar/bottomAppbar.dart';
import 'package:nepek_buyer/pages/home/tabs/cart/widgets/cartHasItems/nested/cart_items.dart';

class CartHasItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
