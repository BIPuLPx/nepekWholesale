import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FilterSearchState with ChangeNotifier {
  bool initialState = false;

  Map filteredBy = {
    "price": {"\$gte": '', "\$lt": ''},
    "brand": [],
    "options": []
  };

  String minPrice = '';
  String maxPrice = '';
  List filteredOptions = [];
  List brands;
  List optionsToFilter;
  Function setFilter;

  void setPrice(Map prices) {
    filteredBy['price']['\$gte'] = prices['min'];
    filteredBy['price']['\$lt'] = prices['max'];
    minPrice = 'NPR ${prices['min']} - ';
    maxPrice = 'NPR ${prices['max']}';
    // print(prices['min'] is String);
    notifyListeners();
    // print(filteredBy);
  }

  void setBrands(List brands) {
    filteredBy['brand'] = brands;
    // print(filteredBy);
    notifyListeners();
  }

  void setOptions(String name, List values) {
    for (var option in filteredOptions) {
      if (option['name'] == name) {
        option['values'] = values;
      }
    }
    notifyListeners();
  }

  void populateFilteredOptions(options) {
    for (var option in options) {
      final newOpt = {'name': option['name'], 'values': option['values']};
      filteredOptions.add(newOpt);
    }
  }

  List pickrequiredOptions(name) {
    for (var option in filteredOptions) {
      if (option['name'] == name) {
        return option['values'];
      }
    }
    return [];
  }
}
