import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:nepek_buyer/functions/check_cart_products.dart';
import 'package:nepek_buyer/pages/home/tabs/cart/widgets/cartHasItems/main.dart';
import 'package:nepek_buyer/pages/home/tabs/cart/widgets/emptyCart/empty_cart.dart';
import 'package:nepek_buyer/savedData/user_data.dart';
import 'package:nepek_buyer/styles/popUps/errorPopUp.dart';
import 'package:nepek_buyer/styles/popUps/info.dart';
import 'package:nepek_buyer/styles/popUps/loading_popup.dart';
import 'package:nepek_buyer/styles/popUps/yes_no.dart';
import 'package:nepek_buyer/styles/spinkit.dart';
import 'package:nepek_buyer/styles/toasts/error_toast.dart';

class CartState with ChangeNotifier {
  Widget body = spinkit;
  Widget yesProducts = CartHasItem();
  Widget noProducts = EmptyCart();
  bool initialgetCart = false;
  List cartItems = [];
  int totalPrice = 0;

  void populateForCheckout(BuildContext context) async {
    if (UserPreferences().getBuyerKey() == null) {
      showErrorToast(context, 'Please sign in first');
      Navigator.pushNamed(
        context,
        'profile',
        arguments: {"page": "home"},
      );
    } else {
      loadingPopUP(context, 'Checking products');
      final checked = await isCartItemsAvailable();
      final av = checked['isAv'];
      final priceChanged = checked['changedPrice'];
      // print(priceChanged);
      Navigator.pop(context);
      if (!av || priceChanged) {
        getAllcartItems(items: checked['items']);
        notifyListeners();

        if (checked['items'].length == 0)
          errorPopup(context, "Sorry the products are not available now");
        else if (priceChanged)
          infoPopUp(
            context,
            'Changed',
            'Note that prices are updated for your products',
            okFn: () => gotoCheckOut(context, true),
          );
        else
          yesNoPopUp(
            context,
            'No Products',
            'Some products are unavailable at the moment\n\nThose products will not be ordered',
            yesFn: () => gotoCheckOut(context, true),
            no: "See Cart",
            noFn: () => Navigator.pop(context),
          );
      } else
        gotoCheckOut(context, false);
    }
  }

  gotoCheckOut(BuildContext context, bool pop) {
    if (pop) Navigator.pop(context);
    List products = [];
    for (var itm in cartItems) {
      final item = itm['item'];
      if (item['av'] != false) {
        final product = {
          "productID": item['productID'],
          "sellerID": item['sellerID'],
          "price": item['price'],
          "qty": int.parse(item['qty']),
          "variant": item['variant'],
          "name": item['name']
        };
        products.add(product);
      }
    }
    Navigator.pushNamed(context, 'order_details',
        arguments: {'products': products, 'refreshCart': refresh});
  }

  void getAllcartItems({items}) {
    cartItems = [];
    dynamic cart = Hive.box('cart');
    if (items != null) cart = items;
    if (cart.length > 0) {
      for (var i = 0; i < cart.length; i++) {
        final item = items != null ? items[i] : cart.getAt(i);
        cartItems.add({'index': i, 'item': item});
        addCartItemsPrice();
      }
    }
    initialgetCart = true;
    checkCart();
  }

  void addCartItemsPrice() {
    totalPrice = 0;
    for (var item in cartItems) {
      if (item['item']['av'] != false)
        totalPrice += item['item']['price'] * int.tryParse(item['item']['qty']);
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
    addCartItemsPrice();
    notifyListeners();
  }

  refresh() {
    cartItems = [];
    checkCart();
    notifyListeners();
  }
}
