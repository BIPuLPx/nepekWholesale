import 'package:flutter/material.dart';
import 'package:nepek_buyer/pages/home/tabs/cart/widgets/bottomAppBar/bottomAppbar.dart';
import 'package:nepek_buyer/pages/home/tabs/cart/widgets/cartHasItems/nested/cart_items.dart';
import 'package:nepek_buyer/styles/text/normal_text.dart';

class CartHasItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: ListView(
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          children: [
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: NepekText(
                "Note: Products on cart remain for 7 days, Please add products to wishlists if you want to store them.",
              ),
            ),
            SizedBox(height: 10),
            CartItems(),
            SizedBox(height: 100),
          ],
        ),
      ),
      bottomNavigationBar: CartActionButton(),
    );
  }
}
