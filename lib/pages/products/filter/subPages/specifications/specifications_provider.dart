import 'package:flutter/material.dart';

class SpecificationsProvider with ChangeNotifier {
  bool initInject = false;
  List currentOptions;
  List allOptions;
  String optionName;
  bool isSending = false;
  var args;

  void clicked(Map val, bool keep) {
    if (keep == true) {
      currentOptions.add(val['value']);
    } else {
      currentOptions.remove(val['value']);
      currentOptions.join(', ');
    }
    // print(currentOptions);
    notifyListeners();
  }

  void apply(BuildContext context) {
    isSending = true;

    notifyListeners();
    args['changeSpecs'](currentOptions, allOptions, optionName)
        .then((_) => Navigator.of(context).pop());
  }
}
