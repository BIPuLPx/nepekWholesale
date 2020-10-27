import 'package:flutter/material.dart';
import 'package:skite_buyer/pages/home/tabs/cart/widgets/cartHasItems/nested/cartItemLayout/nested/footer.dart';
import 'package:skite_buyer/pages/home/tabs/cart/widgets/cartHasItems/nested/cartItemLayout/nested/header.dart';

class CartItemLayout extends StatelessWidget {
  final String name;
  final String price;
  final int index;
  final String quantity;
  final List totalQty;
  CartItemLayout(
      {this.name, this.price, this.index, this.quantity, this.totalQty});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        // color: Colors.white,
        padding: EdgeInsets.only(top: 10, left: 10, right: 10),
        margin: EdgeInsets.only(bottom: 5),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CartItemHeader(
            name: name,
            price: price,
            imageurl:
                'http://rachelwojo.com/wp-content/uploads/2015/05/nature-square.jpg',
          ),
          CartItemFooter(
            index: index,
            quantity: quantity,
            totalQty: totalQty,
          )
        ]),
      ),
    );
  }
}
