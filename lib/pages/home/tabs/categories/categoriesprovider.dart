import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:skite_buyer/pages/home/tabs/categories/data/categories.dart';
import 'package:skite_buyer/pages/home/tabs/categories/data/classes.dart';
import 'package:skite_buyer/pages/home/tabs/categories/data/sub_categories.dart';
import 'package:skite_buyer/styles/colors.dart';

class CategoriesState extends ChangeNotifier {
  bool initState = false;
  List allClasses = classes;
  List categoriesForClasses = [];

  void doInitState() {
    populateCategories('0');
    initState = true;
  }

  void classClicked(Map cls) {
    // print(cls);
    categoriesForClasses = [];
    populateCategories(cls['link']);
    // print(categoriesForClasses);
    notifyListeners();
  }

  void populateCategories(String link) {
    final getCategories = categories[link];
    for (var categories in getCategories) {
      categories['subCategories'] = subCategories[categories['link']];
      categoriesForClasses.add(categories);
    }
  }

  Map leftPanelColors(bool darktheme) {
    if (darktheme) {
      return darkLeftPanelColors;
    }
    return lightSelectionColors;
  }

  Map darkLeftPanelColors = {
    "selected": Colors.white,
    "unselected": Colors.black,
    'selectedText': AppColors().primaryBlue(),
    'unSelectedText': Colors.white
  };

  Map lightSelectionColors = {
    "selected": Colors.white,
    "unselected": Colors.grey[200],
    "text": Colors.yellow,
    'selectedText': AppColors().primaryBlue(),
    'unSelectedText': Colors.black
  };
}
