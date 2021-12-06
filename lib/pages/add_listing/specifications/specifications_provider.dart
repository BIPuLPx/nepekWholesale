import 'package:flutter/material.dart';
import 'package:nepek_buyer/styles/extensions.dart';
import 'package:nepek_buyer/styles/font_styles.dart';
import 'package:nepek_buyer/styles/popUps/errorPopup.dart';

class SpecificationsProvider with ChangeNotifier {
  bool init = false;
  List specifications;
  List currentSpecifications = [];
  List sendingSpecifications = [];
  List specLabels = [];

  void initInject(specifications) {
    for (var spec in specifications) {
      if (spec['values'].length > 0) {
        currentSpecifications
            .add({'name': spec['label'], 'value': spec['values'][0]['label']});
        sendingSpecifications
            .add({'name': spec['label'], 'value': spec['values'][0]['label']});
        specLabels.add(spec['label']);
      }
    }
  }

  checkOthersInputValue(BuildContext context) {
    bool isEmpty = false;
    for (var label in specLabels) {
      for (var specs in sendingSpecifications) {
        if (specs['name'] == label) {
          if (specs['value'] == '' || specs['value'] == 'Other') isEmpty = true;
        }
      }
    }

    if (isEmpty)
      errorPopup(context, "Fill all the Others values first");
    else
      return true;
  }

  getCurrentVal(String name) {
    for (var i in currentSpecifications) {
      if (name == i['name']) {
        return i;
      }
    }
  }

  otherSpecificationInput(String val, String of) {
    for (var j in sendingSpecifications) {
      if (of == j['name']) {
        j['value'] = capitalize(val);
      }
    }
    print(sendingSpecifications);
  }

  specificationChanged(Map val, String of) {
    otherSpecificationInput(val['label'], of);
    for (var j in currentSpecifications) {
      if (of == j['name']) {
        j['value'] = val['label'];
      }
    }
    notifyListeners();
  }

  checkOther(String name) {
    for (var j in currentSpecifications) {
      if (name == j['name'] && j['value'] == 'Other') return true;
    }
    return false;
  }
}
