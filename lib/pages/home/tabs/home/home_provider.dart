import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:nepek_buyer/functions/duplicate.dart';
import 'package:nepek_buyer/library/sync/homepage_data.dart';
import 'package:nepek_buyer/library/sync/product_classification.dart';
import 'package:nepek_buyer/pages/home/tabs/home/main.dart';
import 'package:nepek_buyer/pages/home/tabs/home/wigdets/GridSubCategories/main.dart';
import 'package:nepek_buyer/pages/home/tabs/home/wigdets/advertisement/main.dart';
import 'package:nepek_buyer/pages/home/tabs/home/wigdets/product_collection/main.dart';
import 'package:nepek_buyer/styles/spinkit.dart';
import 'wigdets/carasoul/carasoul.dart';
import 'wigdets/product_slider/main.dart';

class HomeTabProvider with ChangeNotifier {
  final SyncClassification _classifySync = SyncClassification();

  Widget body = logoLoader();
  Box classifications = Hive.box('classifications');
  List allClasses;
  bool initState = false;
  List selectedCategories = [];

  void doInitState() {
    _classifySync.sync().then((_) {
      allClasses = classifications.get('classes');
      // PopulateDatas()
      //     .populateCategories(allClasses[0]['_id'])
      //     .then((categories) {
      //   selectedCategories = categories;
      initState = true;
      body = HomeLayout();
      notifyListeners();
      // });
    });
  }

  void fetchData() {
    // _homeSync.getCarousel().then(
    //       (_) => _homeSync.getHomePageData().then((_) {
    //         _init();
    //         injected = true;
    //         // screen = HomeLayout();
    //         notifyListeners();
    //       }),
    //     );
  }

  _init() {
    // final carouselData = _homePageBox.get('carousel');
    // body.add(
    //   FrontCarasoul(
    //     data: carouselData,
    //   ),
    // );

    // final datas = _homePageBox.get('data');
    // for (var data in datas) {
    //   final int layout = duplicate(data['layout']);
    //   if (existingLayouts.contains(layout)) {
    //     switch (layout) {
    //       case 0:
    //         body.add(
    //           GridSubCategories(
    //             heading: data['heading'],
    //             data: data['val'],
    //           ),
    //         );
    //         break;

    //       case 1:
    //         body.add(
    //           ProductsSlider(
    //             heading: data['heading'],
    //             data: data['val'],
    //           ),
    //         );
    //         break;

    //       case 2:
    //         body.add(
    //           ProductCollection(
    //             heading: data['heading'],
    //             data: data['val'],
    //           ),
    //         );
    //         break;

    //       case 3:
    //         body.add(
    //           HomeAd(
    //             heading: data['heading'],
    //             data: data['val'],
    //           ),
    //         );
    //         break;

    //       default:
    //         break;
    //     }
    //   }
    // }
  }
}
