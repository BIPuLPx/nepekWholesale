import 'package:flutter/material.dart';
import 'package:skite_buyer/pages/home/tabs/cart/widgets/cartHasItems/nested/cartItemLayout/nested/footer.dart';
import 'package:skite_buyer/pages/home/tabs/cart/widgets/cartHasItems/nested/cartItemLayout/nested/header.dart';

class CartItemLayout extends StatelessWidget {
  final String name;
  final String price;
  final int index;
  final String quantity;
  final List totalQty;
  final String imgName;
  final String uid;
  CartItemLayout({
    this.name,
    this.price,
    this.index,
    this.quantity,
    this.totalQty,
    this.imgName,
    this.uid,
  });
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
                'https://skiteimages.ams3.digitaloceanspaces.com/productImages/$uid/miniThumb/$imgName',
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
