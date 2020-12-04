import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:nepek_buyer/savedData/apis.dart';

class SearchState extends ChangeNotifier {
  bool initState = false;

  List autoCompletes = [];

  Future autoComplete(term) async {
    // autoCompletes = [];
    // print(autoCompletes);
    var response;
    response = await http.get('$productApi/products/autocomplete?term=$term');
    final res = jsonDecode(response.body);
    autoCompletes = res;
    // print(res);
    notifyListeners();
  }
}
