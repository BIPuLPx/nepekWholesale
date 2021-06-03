import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:nepek_buyer/pages/my/myquestions/subpages/viewQna/layout/main.dart';
import 'package:nepek_buyer/savedData/apis.dart';
import 'package:nepek_buyer/savedData/httpUri.dart';
import 'package:nepek_buyer/styles/spinkit.dart';

class ViewQnaProvider with ChangeNotifier {
  bool initFetched = false;
  Widget body = logoLoader();
  Map productData;

  getQna(String id) async {
    final response = await get(
      httpUri(
        productApi,
        'qna/buyer/single_qna/$id',
      ),
    );
    productData = jsonDecode(response.body);
    initFetched = true;
    body = ViewQnaDataLayout();
    notifyListeners();
  }
}
