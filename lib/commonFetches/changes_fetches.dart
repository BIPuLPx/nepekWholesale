import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nepek_buyer/savedData/httpUri.dart';

import '../savedData/apis.dart';

class ChangesFetch {
  Future checkChanged(String of) async {
    var response;
    response = await http.get(httpUri(peopleApi, 'changes/get?of=$of'));
    return jsonDecode(response.body)['new_id'];
  }
}
