import 'package:flutter/material.dart';

class FrontEnd {
  bool isThisChangedSpec(String specName, Map lastFiltered) {
    if (lastFiltered['name'] == 'specifications') {
      if (lastFiltered['specName'] == specName) {
        return true;
      }
      return false;
    }
    return false;
  }

  List getSelectedSpecs(List specsValues, List currentSpecs) {
    List vals = [];

    for (var specValue in specsValues) {
      if (currentSpecs.contains(specValue['value'])) {
        vals.add(specValue['value']);
      }
    }
    return vals;
  }

  void apply(BuildContext context, Map queryFilter, args, Map lastFiltered) {
    // print(args);
    // print(queryFilter);
    args['refreshResultWithFilter'](queryFilter, lastFiltered)
        .then((_) => Navigator.of(context).pop());
  }
}

// http://127.0.0.1:8000
