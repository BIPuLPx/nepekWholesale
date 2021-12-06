import 'package:flutter/material.dart';
import 'package:nepek_buyer/styles/extensions.dart';
import 'package:nepek_buyer/styles/toasts/error_toast.dart';

import 'details_validators.dart';

class DetailsProvider with ChangeNotifier {
  final _validators = Validators();
  final detailsKey = GlobalKey<FormState>();
  int highlightsNo = 1;
  bool autoValidateDetails = false;
  List highLights = [
    {'index': 1, 'value': ''}
  ];

  Map details = {
    'listingName': '',
    'price': '',
    'description': '',
  };

  String nameValidator(val) => _validators.nameValidator(val);

  String brandValidator(val) => _validators.brandValidator(val);

  String priceValidator(val) => _validators.priceValidator(details['price']);

  String qtyValidator(val) => _validators.qtyValidator(val);

  String descriptionValidator(val) => _validators.descriptionValidator(val);
  String highlightsValidator(val) => _validators.hightlightsValidator(val);

  void setDetails(String value, String type) {
    if (type == 'price') {
      details[type] = value.substring(4).replaceAll(',', '');
    } else
      details[type] = capitalize(value);
    notifyListeners();
  }

  increaseHighlight(BuildContext context) {
    if (highlightsNo < 10) {
      highlightsNo += 1;
      highLights.add({'index': highlightsNo, 'value': ''});
      notifyListeners();
    } else
      showErrorToast(context, 'Highlights cannot exceed 10');
  }

  inputHighlights(int index, String val) {
    for (var highlight in highLights) {
      if (highlight['index'] == index + 1) {
        highlight['value'] = capitalize(val);
      }
    }
  }

  bool next() {
    if (detailsKey.currentState.validate()) {
      return true;
    } else {
      autoValidateDetails = true;
      notifyListeners();
      return false;
    }
  }

  void injectHightlights() {
    List sendHighlights = [];
    for (var i in highLights) {
      sendHighlights.add(i['value']);
    }
    details['highlights'] = sendHighlights;
  }

  void autoValidate() {
    autoValidateDetails = true;
    notifyListeners();
  }
}
