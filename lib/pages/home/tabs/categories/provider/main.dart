import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:skite_buyer/pages/home/tabs/categories/provider/modules/data_populated.dart';

import 'modules/dark_light_colors.dart';
import 'modules/populate_data.dart';

class CategoriesState extends ChangeNotifier {
  Widget body = Container();
  Box classifications = Hive.box('classifications');
  List allClasses;
  bool initState = false;
  List selectedCategories = [];

  void doInitState() {
    allClasses = classifications.get('classes');

    PopulateDatas().populateCategories(allClasses[0]['_id']).then((categories) {
      selectedCategories = categories;
      initState = true;
      body = DataPopulated();
      notifyListeners();
    });
  }

  void classClicked(Map cls) {
    PopulateDatas().populateCategories(cls['_id']).then((categories) {
      selectedCategories = categories;
      notifyListeners();
    });
  }

  Map leftPanelColors(bool darktheme) =>
      LightDarkColors().leftPanelColors(darktheme);
}
