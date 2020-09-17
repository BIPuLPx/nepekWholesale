import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:skite_buyer/savedData/apis.dart';

class SearchState extends ChangeNotifier {
  List autoCompletes = [];

  Future autoComplete(term) async {
    var response;
    response =
        await http.get('$productApi/products/fetch/autocomplete?term=$term');
    final res = jsonDecode(response.body);
    autoCompletes = res;
    // print(res);
    notifyListeners();
  }
}
