class OptionsAndVariants {
  init(options, variants) {
    var avVariants = getavVariants(variants);
    if (avVariants.length > 0) {
      final uniqueVariants = getAllVariantValue(avVariants);
      final indexedVariants = makeVarientsIndex(avVariants);
      final availableOpt = trimOutdatedOption(options, uniqueVariants);
      final selectedOption = avVariants[0]['variants'];

      return {
        'avVariants': avVariants,
        'indexedVariants': indexedVariants,
        'availableOpt': availableOpt,
        'selectedOption': selectedOption
      };
    }
  }

  getAllVariantValue(variants) {
    var varient = [];
    for (var i in variants) {
      var v = i['variants'];
      for (var j in v) {
        if (!varient.contains(j)) varient.add(j);
      }
    }
    return varient;
  }

  makeVarientsIndex(variants) {
    var indexedVariants = [];
    var indexes = [];
    for (var i in variants) {
      final fromVarients = i['variants'];
      for (var j in fromVarients) {
        final varientsValue = j;
        final _index = fromVarients.indexOf(j);
        if (!indexes.contains(_index)) {
          indexes.contains(_index);
          indexedVariants.add({
            'index': _index,
            'values': [varientsValue]
          });
        } else {
          var indexedVariantsValue = j['values'];
          if (!indexedVariantsValue.contains(varientsValue))
            indexedVariantsValue.add(varientsValue);
        }
      }
    }
    return indexedVariants;
  }

  trimOutdatedOption(options, uniqueV) {
    for (var i in options) {
      var ovals = i['value'];
      for (var j in ovals) {
        if (ovals.length == 1) j['one'] = true;
        if (!uniqueV.contains(j['label'])) j['index'] = -1;
      }
    }
    for (var i in options) {
      var ovals = i['value'];
      final newoval = ovals.where((oval) => oval['index'] != -1).toList();
      i['value'] = newoval;
    }
    return options;
  }

  getActiveOptions(variants, selectedOption, indexedVariants) {
    // print(variants);
    // print(selectedOption);
    final optionsIndex = getIndexofVals(selectedOption, indexedVariants, false);
    // print(optionsIndex);
    var variantValues = [];
    for (var i in variants) {
      var v = i['variants'];
      var count = 0;
      for (var j in v) {
        final fromvar = j;
        for (var k in selectedOption) {
          final fromopt = k;
          if (fromopt == fromvar) {
            count += 1;
          }
        }
      }
      if (selectedOption.length == count) {
        variantValues = [...variantValues, ...v];
      } else if (selectedOption.length - 1 == count) {
        // final vIndex = getIndexofVals(v, indexedVariants, false);
        final getEqualIndex = getEqualIndexValue(optionsIndex, v);
        variantValues = [...variantValues, ...getEqualIndex];
      }
    }
    var trim = variantValues.toSet().toList();
    return trim;
  }

  getIndexofVals(vals, indexedVariants, swap) {
    var retrive = {};
    for (var k in vals) {
      final val = k;
      for (var i in indexedVariants) {
        final valueInsideIndex = i['values'];
        for (var j in valueInsideIndex) {
          final value = j;
          if (val == value) {
            if (swap)
              retrive[val] = i['index'];
            else
              retrive[i['index']] = val;
          }
        }
      }
    }
    return retrive;
  }

  getEqualIndexValue(optionsIndex, v) {
    var retrive = [];
    for (var i in v) {
      if (optionsIndex[v.indexOf(i)] != null) retrive.add(i);
    }
    return retrive;
  }

  List getavVariants(List variants) {
    List avVariant = [];
    variants.forEach((element) {
      if (element['qty'] > 0) avVariant.add(element);
    });
    return avVariant;
  }

  getCurrentPriceAndQuantity(variants, currentOptions) {
    print('here');
    print(variants);
    print(currentOptions);
    if (variants.length > 0 && currentOptions.length > 0) {
      final optionsLength = currentOptions.length;
      final variantLength = variants[0]['variants'].length;
      if (optionsLength == variantLength) {
        for (var variant in variants) {
          var count = 0;
          for (var varValue in variant['variants']) {
            for (var option in currentOptions) {
              if (option == varValue) count += 1;
            }
          }
          if (count == optionsLength) {
            return {"qty": variant["qty"], "price": variant["price"]};
          }
        }
      }
    }
  }

  getOptImage(List availableOpt, List selectedOption) {
    for (var option in availableOpt) {
      if (option['name'] == 'Color Group') {
        for (var value in option['value']) {
          if (selectedOption.contains(value['label'])) {
            return '${option['imageKey']}/${value['imgName']}';
          }
        }
        return '${option['imageKey']}/${option['value'][0]['imgName']}';
      }
    }
  }
}
