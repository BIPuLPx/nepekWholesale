import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:nepek_buyer/functions/duplicate.dart';
import 'package:nepek_buyer/library/sync/custom_products.dart';
import 'package:nepek_buyer/pages/products/viewProduct/view_product_layout.dart';
import 'dart:convert';
import 'package:nepek_buyer/savedData/apis.dart';
import 'package:nepek_buyer/savedData/httpUri.dart';
import 'package:nepek_buyer/savedData/user_data.dart';
import 'package:nepek_buyer/styles/popUps/errorPopUp.dart';
import 'package:nepek_buyer/styles/spinkit.dart';
import 'package:nepek_buyer/styles/toasts/error_toast.dart';
import 'package:nepek_buyer/styles/toasts/sucess_toast.dart';

import 'logic/options_and_variants.dart';
import 'widgets/addedToCart/main.dart';

class ViewProductState with ChangeNotifier {
  OptionsAndVariants _optionsAndVariants = OptionsAndVariants();
  final cart = Hive.box('cart');
  Box _customProductBox = Hive.box('customProducts');
  SyncCustomProducts _syncPdt = SyncCustomProducts();

  String productID;
  bool initialFetch = false;
  dynamic result = LoaderWithAppBar();
  List productImgs;
  String miniThumb;
  String imgDir;
  String sellerID;
  String productBrand;
  String productName;
  double productRating;
  int noOfReviews;
  String imgUrl;
  String productPrice;
  List productOptions;
  String productDescription;
  List productHighlights;
  List productSpecifications;
  String subCategory;
  List productReviews;
  List productQnas = [];
  List productVariants = [];
  List buyerIds = [];
  String qtyToBuy = '1';
  List<String> totalQty = [];
  List wishLists = [];
  List activeOptions = [];
  List avVariants = [];
  List indexedVariants = [];
  List availableOpt = [];
  List selectedOption = [];
  Map currentPriceAndQty = {"qty": 0, 'price': 0};
  String storeName;
  List storeProducts;
  List similarProducts;
  int screen = 1;
  String optImg;

  Future fetchProduct() async {
    var response;
    response =
        await http.get(httpUri(productApi, 'products/fetch/single/$productID'));
    final res = jsonDecode(response.body);
    // print(res);
    productID = res['_id'];
    imgDir = res['imgDir'];
    sellerID = res['seller_id'];
    productBrand = res['brand'];
    productName = res['productName'];
    productRating = double.parse(res['rating'].toString());
    noOfReviews = res['ratingNo'];
    productPrice = res['price'].toString();
    productOptions = res['options'];
    productHighlights = res['highlights'];
    productSpecifications = res['specifications'];
    productReviews = res['reviews'];
    imgUrl = res['imgUrl'];
    productImgs = res['imgs'];
    miniThumb = res['miniThumb'];
    productVariants = res['variants'];
    productQnas = res['qnas'];
    storeName = res['storeName'];
    subCategory = res['subcategory'];
    // getQnames(res['qna']);
    storeProducts = res['store_products'];
    similarProducts = res['similar_products'];
    initialFetch = true;
    //
    populateQty(res['qty']);
    getWishLists();
    result = ViewProductLayout();
    if (productOptions.length > 0 && productVariants.length > 0) {
      var initVariants =
          _optionsAndVariants.init(productOptions, productVariants);
      avVariants = initVariants['avVariants'];
      availableOpt = initVariants['availableOpt'];
      selectedOption = initVariants['selectedOption'];
      indexedVariants = initVariants['indexedVariants'];
      useEffect();
    } else {
      notifyListeners();
    }
  }

  useEffect() {
    activeOptions = _optionsAndVariants.getActiveOptions(
        avVariants, selectedOption, indexedVariants);
    if (selectedOption.length == activeOptions.length)
      currentPriceAndQty = _optionsAndVariants.getCurrentPriceAndQuantity(
        avVariants,
        selectedOption,
      );
    optImg = _optionsAndVariants.getOptImage(availableOpt, selectedOption);
    productPrice = currentPriceAndQty['price'].toString();
    qtyToBuy = '1';
    populateQty(currentPriceAndQty['qty']);
    notifyListeners();
  }

  changeOption(String value, bool keep) {
    if (keep) {
      final selectedOptionIndexes = _optionsAndVariants.getIndexofVals(
          selectedOption, indexedVariants, false);
      final valueIndex =
          _optionsAndVariants.getIndexofVals([value], indexedVariants, true);
      final trimFromSelectedOption = selectedOptionIndexes[valueIndex[value]];
      if (trimFromSelectedOption != null) {
        var newSelectedOption = selectedOption
            .where((opt) => opt != trimFromSelectedOption)
            .toList();
        selectedOption = [...newSelectedOption, value];
      } else
        selectedOption = [...selectedOption, value];
    } else
      selectedOption = selectedOption.where((opt) => opt != value).toList();
    useEffect();
  }

  void populateQty(int qty) {
    totalQty = [];
    for (var i = 1; i <= qty; i++) if (i <= 5) totalQty.add(i.toString());
  }

  void changeQty(String val) => qtyToBuy = val;

  bool checkDuplicate() {
    List cartItems = cart.values.toList(growable: false);
    for (var item in cartItems) if (item['name'] == productName) return true;
    return false;
  }

  void addTocart(Map data, BuildContext context) {
    cart.add(data);
    changeScreen(1);
    addedToCart(context, productName, productPrice);
  }

  void refresh() {
    screen = 1;
    result = logoLoader();
    notifyListeners();
    fetchProduct();
  }

  void done(BuildContext context) {
    if (availableOpt.length != selectedOption.length) {
      errorPopup(context, 'Please select the variant first');
    } else if (checkDuplicate() == true) {
      errorPopup(context, 'This product is already in your cart');
    } else {
      final Map data = getCartData();
      addTocart(data, context);
    }
  }

  getCartData() {
    Map cartData = {
      'imgDir': imgDir,
      'imgUrl': imgUrl,
      'productID': productID,
      'name': productName,
      'qty': qtyToBuy,
      'totalQty': totalQty,
      'miniThumb': miniThumb,
      'subCategoryID': subCategory,
      'sellerID': sellerID,
      'price': int.parse(productPrice),
      'date': DateTime.now().toLocal().toString()
    };
    Map variant = {};

    if (avVariants.length > 0)
      for (var opt in selectedOption)
        for (var avOpt in availableOpt)
          for (var value in avOpt['value'])
            if (value['label'] == opt)
              variant[avOpt['name']] = opt;
            else
              continue;

    cartData['variant'] = variant;
    return cartData;
  }

  void changeScreen(int to) {
    screen = to;
    notifyListeners();
  }

  void getWishLists() =>
      wishLists = duplicate(_customProductBox.get('wishlist') ?? []);

  bool isWishListed() => wishLists.contains(productID);

  void toggleFav(BuildContext context) async {
    print(wishLists);
    if (UserPreferences().getLoggedIn() != true) {
      showErrorToast(context, "Please sign in");
      Navigator.pushNamed(context, 'profile',
          arguments: {"page": "view_product"});
    } else {
      final String crdl = isWishListed() ? 'pull' : 'add';
      if (isWishListed())
        wishLists.remove(productID);
      else
        wishLists.add(productID);
      notifyListeners();

      final status = await _syncPdt.crdlCustomProducts(productID, crdl);
      if (status == 200)
        sucessToast(
          context,
          '${crdl == 'pull' ? 'Pulled from' : 'Added in'} wishlists',
          marginBottom: 50,
        );
    }
  }
}
