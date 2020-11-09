import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:nepek_buyer/pages/home/tabs/cart/widgets/cartHasItems/main.dart';
import 'package:nepek_buyer/pages/home/tabs/cart/widgets/emptyCart/empty_cart.dart';
import 'package:nepek_buyer/savedData/user_data.dart';
import 'package:nepek_buyer/styles/spinkit.dart';
import 'package:nepek_buyer/styles/toasts/error_toast.dart';

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
      "refresh": refresh
    };
    for (var itm in cartItems) {
      final item = itm['item'];
      final product = {
        "product_id": item['product_id'],
        "productName": item['name'],
        "qty": int.parse(item['qty']),
        "seller_id": item['seller_uid'],
        "options": item["options"],
        "price": item['price']
      };
      data['products'].add(product);
    }
    if (UserPreferences().getBuyerKey() == null) {
      showErrorToast(context, 'Please sign in first');
      Navigator.pushNamed(
        context,
        'profile',
        arguments: {"page": "home"},
      );
    } else {
      Navigator.pushNamed(context, 'order_now', arguments: data);
    }
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

  void addCartItemsPrice() {
    totalPrice = 0;
    for (var item in cartItems) {
      totalPrice += int.parse(item['item']['price']);
    }
  }

  void deleteItem(int index) {
    cartItems.removeAt(index);
    final cart = Hive.box('cart');
    cart.deleteAt(index);
    addCartItemsPrice();
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

  refresh() {
    cartItems = [];
    checkCart();
    notifyListeners();
  }
}
