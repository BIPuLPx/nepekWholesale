import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:skite_buyer/pages/home/tabs/cart/widgets/cartHasItems/main.dart';
import 'package:skite_buyer/pages/home/tabs/cart/widgets/emptyCart/empty_cart.dart';
import 'package:skite_buyer/styles/spinkit.dart';

class CartState with ChangeNotifier {
  Widget body = spinkit;
  Widget yesProducts = CartHasItem();
  Widget noProducts = EmptyCart();

  final cart = Hive.box('cart');
  bool initialgetCart = false;
  List cartItems = [];

  void getAllcartItems() {
    // cart.clear();
    if (cart.length > 0) {
      for (var i = 0; i < cart.length; i++) {
        // print(cart.getAt(i));
        cartItems.add({'index': i, 'item': cart.getAt(i)});
        // cart.deleteAt(i);
        // print()
        // print(cartItems);
      }
    }
    checkCart();

    initialgetCart = true;
  }

  void deleteItem(int index) {
    cartItems.removeAt(index);
    cart.deleteAt(index);
    checkCart();
    notifyListeners();
  }

  void checkCart() {
    if (cartItems.length == 0) {
      body = noProducts;
    } else {
      body = yesProducts;
    }
  }

  void changeQty(int index, String value) {
    // print('$index need value $value');
    for (var item in cartItems) {
      if (item['index'] == index) {
        item['item']['qty'] = value;
        cart.putAt(index, item['item']);
        // print(item);
      }
    }
  }
}
