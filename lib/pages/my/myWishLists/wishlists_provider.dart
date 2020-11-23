import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:nepek_buyer/savedData/apis.dart';
import 'package:nepek_buyer/savedData/user_data.dart';
import 'package:nepek_buyer/styles/popUps/loading_popup.dart';
import 'layout.dart';
import 'no_wishlists.dart';

class WishListsProvider with ChangeNotifier {
  Widget body = spinkit;
  bool initFetched = false;
  List wishLists;

  Future getMyWishLists() async {
    final response = await get(
      '$productApi/custom_products/get?type=wishlist',
      headers: {'Authorization': 'Bearer ${UserPreferences().getJwtToken()}'},
    );
    wishLists = jsonDecode(response.body)['products'];
    if (wishLists.length > 0) {
      body = WishListsLayout();
    } else {
      body = NoWishLists();
    }
    initFetched = true;
    notifyListeners();
  }
}


