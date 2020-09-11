import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FilterSearchState with ChangeNotifier {
  bool initialState = false;

  Map filteredBy = {
    "price": {"\$gte": 0, "\$lt": 0},
    "brand": [],
    "options": []
  };
  List brands;
  Map filterOptions;
  Function setFilter;

  void setBrands(List brands) {
    filteredBy['brand'] = brands;
    // print(filteredBy);
    notifyListeners();
  }
}
