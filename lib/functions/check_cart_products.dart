import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:http/http.dart';
import 'package:nepek_buyer/functions/token_header.dart';
import 'package:nepek_buyer/savedData/apis.dart';
import 'package:nepek_buyer/savedData/httpUri.dart';

Future isCartItemsAvailable() async {
  Box cartBox = Hive.box('cart');
  final List cart = cartBox.values.toList();
  if (cart.length > 0) {
    List toSend = [];
    bool isAv = true;

    for (Map item in cart) {
      final DateTime addedIn = DateTime.parse(item['date']);
      final DateTime beforeSevenDays =
          DateTime.now().subtract(Duration(days: 6));

      if (!addedIn.isBefore(beforeSevenDays)) {
        Map sendVal = {'_id': item['productID'], 'qty': int.parse(item['qty'])};
        final variant = item['variant'];
        if (variant.length > 0) {
          String varVal = '';
          variant.forEach((key, value) => varVal += '$value , ');
          varVal = varVal.substring(0, varVal.length - 3);
          sendVal['variant'] = varVal;
        }
        toSend.add(sendVal);
      } else
        isAv = false;
    }

    final res = await post(httpUri(productApi, 'cart_products/check'),
        headers: contentTypeHeader(), body: jsonEncode(toSend));

    bool changedPrice = false;

    final dataFromDB = jsonDecode(res.body);
    // print(dataFromDB);
    List items = [];
    if (toSend.length > 0)
      for (Map item in cart) {
        for (Map fromDB in dataFromDB) {
          if (fromDB['_id'] == item['productID']) {
            if (item['price'] != fromDB['price']) changedPrice = true;
            item['price'] = fromDB['price'];
            if (fromDB['ok'])
              items.add({...item, 'av': true});
            else {
              items.add({...item, 'av': false});
              isAv = false;
            }

            continue;
          }
        }
      }
    cartBox.clear().then((_) => cartBox.addAll(items));
    return {"isAv": isAv, "items": items, "changedPrice": changedPrice};
  }
}
