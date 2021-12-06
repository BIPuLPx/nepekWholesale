import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'dropdown_layout.dart';

class ClassifyProvider with ChangeNotifier {
  final classificationBox = Hive.box('classifications');
  bool init = false;
  Widget body = Container();
  List classes;
  List categories;
  List subCategories;
  Map currentdata = {};

  void initInject() {
    classes = classificationBox.get('classes');
    injectCategory(classes[0]);
    init = true;
    body = DropDownLayout();
  }

  injectCategory(Map val) {
    final List allCategories = classificationBox.get('categories');
    final data = allCategories
        .where((element) => element['class_id'] == val['_id'])
        .toList();
    if (data.length > 0) {
      final done = injectSubcategory(data[0]);
      if (done) {
        categories = data;
        currentdata['class'] = val;
      }
    }
  }

  bool injectSubcategory(Map val) {
    bool done = false;
    final List allSubCategories = classificationBox.get('subcategories');
    final data = allSubCategories
        .where((element) => element['category_id'] == val['_id'])
        .toList();
    if (data.length > 0) {
      done = true;
      subCategories = data;
      currentdata['category'] = val;
      currentdata['subcategory'] = subCategories[0];
    }
    return done;
  }

  subCategoryChanged(val) {
    currentdata['subcategory'] = val;
  }

  void dropdownChanged(val, heading) {
    if (heading == 'Class') {
      injectCategory(val);
    } else if (heading == 'Category') {
      injectSubcategory(val);
    } else {
      subCategoryChanged(val);
    }
    notifyListeners();
  }
}
