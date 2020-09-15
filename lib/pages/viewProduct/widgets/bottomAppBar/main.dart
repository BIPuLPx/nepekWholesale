import 'package:flutter/material.dart';
import 'package:skite_buyer/pages/viewProduct/widgets/bottomAppBar/nested/add_to_cart.dart';

class ViewProductBottomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        child: Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      child: AddToCart(),
    ));
  }
}
