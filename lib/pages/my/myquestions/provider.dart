import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:nepek_buyer/pages/my/myquestions/main.dart';
import 'package:nepek_buyer/savedData/httpUri.dart';
import 'package:nepek_buyer/styles/empty_data/main.dart';
import 'package:nepek_buyer/styles/spinkit.dart';
import 'package:nepek_buyer/savedData/apis.dart';
import 'package:nepek_buyer/savedData/user_data.dart';
import 'package:http/http.dart' as http;

class MyQuestionsProvider with ChangeNotifier {
  bool initFetch = false;
  Widget body = logoLoader();
  List myQnas;

  Future fetchQna() async {
    // print('here');
    final response = await http.get(
      httpUri(serviceTwo, 'qna/buyer/own_qnas?type=normal'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${UserPreferences().getJwtToken()}'
      },
    );
    final data = jsonDecode(response.body);
    if (data.length > 0) {
      myQnas = data;
      body = MyQnasLayout();
    } else {
      body = NoQnas();
    }
    initFetch = true;
    notifyListeners();
  }
}

class NoQnas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return EmptyData(
      label: 'No QNAs',
      asset: 'no_qnas',
    );
  }
}
