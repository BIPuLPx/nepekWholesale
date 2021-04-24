import 'package:flutter/material.dart';
import 'package:nepek_buyer/styles/popUps/errorPopUp.dart';

class PriceProvider with ChangeNotifier {
  Map fetchedFilter;
  Map queryFilter;
  var priceChanged;
  Map price = {'min': '', 'max': ''};

  init(args) {
    print(args);
    fetchedFilter = args['fetchedFilter'];
    queryFilter = args['queryFilter'];
    priceChanged = args['priceChanged'];
    price['min'] = args['fetchedFilter']['min'].toString();
    price['max'] = args['fetchedFilter']['max'].toString();
  }

  void priceChangedLocal(type, val) {
    if (type == 'Min') {
      price['min'] = val;
    } else {
      price['max'] = val;
    }
  }

  void changed(BuildContext context) {
    if (int.parse(price['min']) > fetchedFilter['max'] ||
        int.parse(price['max']) > fetchedFilter['max'])
      errorPopup(context,
          'Sorry!\nThere are no products of price more than NPR ${fetchedFilter['max']} for your search');
    else if (int.parse(price['min']) > int.parse(price['max']))
      errorPopup(context, 'Minimum price must be lower Maximum');
    else {
      priceChanged(price);
      Navigator.of(context).pop();
    }
  }
}
