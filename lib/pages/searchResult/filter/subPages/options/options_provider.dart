import 'package:flutter/material.dart';

class OptionsProvider with ChangeNotifier {
  bool initInject = false;
  List currentOptions;
  List allOptions;
  String optionName;
  bool isSending = false;
  var args;

  void clicked(Map val, bool keep) {
    // print(val);
    // print(keep);
    if (keep == true) {
      currentOptions.add(val['name']);
    } else {
      currentOptions.remove(val['name']);
      currentOptions.join(', ');
    }
    // print(currentOptions);
    notifyListeners();
  }

  void apply() {
    
    isSending = true;

    notifyListeners();
  }
}
