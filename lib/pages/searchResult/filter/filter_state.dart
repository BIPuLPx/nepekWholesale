import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FilterSearchState with ChangeNotifier {
  bool initialState = false;

  Map filteredBy = {
    "price": {"min": '', "max": ''},
    "brand": [],
    'options': []
  };

  String minPrice = '';
  String maxPrice = '';
  List filteredOptions = [];
  List brands;
  List optionsToFilter;

  void setPrice(Map prices) {
    filteredBy['price']['min'] = prices['min'];
    filteredBy['price']['max'] = prices['max'];
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
    // for (var val in values) {
    //   if (!filteredBy['options'].contains(val)) {
    //     filteredBy['options'].add(val);
    //   }
    // }
    // print(filteredBy);
    notifyListeners();
  }

  void populateFilteredOptions(options) {
    // print('filter');
    // print(options);
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
