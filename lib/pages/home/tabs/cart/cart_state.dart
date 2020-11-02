import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:skite_buyer/pages/home/tabs/cart/widgets/cartHasItems/main.dart';
import 'package:skite_buyer/pages/home/tabs/cart/widgets/emptyCart/empty_cart.dart';
import 'package:skite_buyer/savedData/user_data.dart';
import 'package:skite_buyer/styles/spinkit.dart';

class CartState with ChangeNotifier {
  Widget body = spinkit;
  Widget yesProducts = CartHasItem();
  Widget noProducts = EmptyCart();
  bool initialgetCart = false;
  List cartItems = [];
  int totalPrice = 0;

  void populateForCheckout(BuildContext context) {
    var data = {
      "buyer_id": UserPreferences().getBuyerKey(),
      "products": [],
    };
    for (var itm in cartItems) {
      final item = itm['item'];
      final product = {
        "productName": item['name'],
        "qty": item['name'],
        "seller_id": item['seller_uid'],
        "options": item["options"],
        "price": item['price']
      };
      data['products'].add(product);
    }
    Navigator.pushNamed(context, 'checkout', arguments: data);
  }

  void getAllcartItems() {
    cartItems = [];
    final cart = Hive.box('cart');
    if (cart.length > 0) {
      for (var i = 0; i < cart.length; i++) {
        final item = cart.getAt(i);
        cartItems.add({'index': i, 'item': item});
        totalPrice += int.parse(item['price']);
      }
    }
    initialgetCart = true;
    checkCart();
  }

  void deleteItem(int index) {
    cartItems.removeAt(index);
    final cart = Hive.box('cart');
    cart.deleteAt(index);
    checkCart();
    notifyListeners();
  }

  findLocalindex(i) {
    for (var item in cartItems) {
      if (i == item['index']) {
        return cartItems.indexOf(item);
      }
    }
  }

  void checkCart() {
    if (cartItems.length == 0) {
      body = noProducts;
    } else {
      body = yesProducts;
    }
  }

  void changeQty(int index, String value) {
    final cart = Hive.box('cart');
    for (var item in cartItems) {
      if (item['index'] == index) {
        item['item']['qty'] = value;
        cart.putAt(index, item['item']);
      }
    }
    notifyListeners();
  }
}
