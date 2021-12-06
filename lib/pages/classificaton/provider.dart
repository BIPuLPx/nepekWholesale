import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:nepek_buyer/pages/classificaton/main.dart';
import 'package:nepek_buyer/styles/spinkit.dart';

class ClassificationProvider with ChangeNotifier {
  var args;
  bool initState = false;
  Widget body = logoLoader();
  Box classifications = Hive.box('classifications');
  List classifiedList;

  doInitState() {
    // if
    populateCategories(args['_id']);
    body = CategoriesLayout();
    // notifyListeners();
  }

  Future populateCategories(String classID) async {
    final allCategories = classifications.get('categories');
    final categoriesFiltered =
        allCategories.where((classs) => classs['class_id'] == classID).toList();
    classifiedList = categoriesFiltered;
  }
}
