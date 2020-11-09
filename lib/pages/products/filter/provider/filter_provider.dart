import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nepek_buyer/pages/products/filter/provider/backend.dart';
import 'package:nepek_buyer/pages/products/filter/provider/frontend.dart';

class FilterProvider with ChangeNotifier {
  final _backend = BackEnd();
  final _frontend = FrontEnd();
  var args;
  Map fetchedFilter;
  bool initialState = false;
  Map queryFilter;
  Map lastFiltered = {};
  int totalProducts;
  bool setLoadingApply = false;
  bool setResetApply = false;

  Future priceChanged(Map price) async {
    print(price);
// queryFilter["price"]["\$gte"]= price["min"]

// queryFilter
  }

  Future brandChanged(List brands, List lastValues) async {
    queryFilter['brand'] = brands;
    lastFiltered = {'name': 'brand', 'value': lastValues};
    await _backend
        .filterProductsWithSearch(args['type'], queryFilter, args['searchText'])
        .then((value) {
      fetchedFilter = value['filtersOptions'];
      totalProducts = value['totalProductsNo'];

      notifyListeners();
    });
  }

  Future specsChanged(
      List specifications, List lastValues, String specName) async {
    // print(lastValues);
    queryFilter['specifications'] = specifications;
    lastFiltered = {
      'name': 'specifications',
      'specName': specName,
      'value': lastValues
    };
    await _backend
        .filterProductsWithSearch(args['type'], queryFilter, args['searchText'])
        .then((value) {
      fetchedFilter = value['filtersOptions'];
      totalProducts = value['totalProductsNo'];

      notifyListeners();
    });
  }

  bool checkLastSpecs(String specName) {
    return _frontend.isThisChangedSpec(specName, lastFiltered);
  }

  List getSelectedSpecs(List specsValues) {
    return _frontend.getSelectedSpecs(
        specsValues, queryFilter['specifications']);
  }

  void apply(BuildContext context) {
    setLoadingApply = true;
    notifyListeners();
    _frontend.apply(context, queryFilter, args, lastFiltered);
  }

  void reset(BuildContext context) {
    setResetApply = true;
    notifyListeners();
    args['resetFilter']().then((_) => Navigator.of(context).pop());
  }
}
