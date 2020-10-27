import 'package:flutter/material.dart';

class BrandProvider with ChangeNotifier {
  bool initInject = false;
  var args;
  List currentBrands;
  List allBrands;
  bool isApplying = false;

  void clicked(Map value, bool keep) {
    final val = value['name'];
    if (keep == true) {
      currentBrands.add(val);
    } else {
      currentBrands.remove(val);
      currentBrands.join(', ');
    }
    // print(currentBrands);
    notifyListeners();
  }

  void apply(BuildContext context) {
    isApplying = true;
    notifyListeners();
    // print(allBrands);
    // print(currentBrands);
    args['changeBrand'](currentBrands, allBrands).then((_) {
      Navigator.of(context).pop();
    });

    // print(args);
  }
}
