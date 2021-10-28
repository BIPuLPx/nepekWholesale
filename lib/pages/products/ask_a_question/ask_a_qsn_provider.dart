import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:nepek_buyer/functions/token_header.dart';
import 'package:nepek_buyer/savedData/apis.dart';
import 'package:nepek_buyer/savedData/httpUri.dart';
import 'package:nepek_buyer/styles/popUps/errorPopUp.dart';
import 'package:http/http.dart' as http;
import 'package:nepek_buyer/styles/popUps/loading_popup.dart';
import 'package:nepek_buyer/styles/popUps/sucessPopup.dart';

class AskaQuestionProvider with ChangeNotifier {
  var args;
  String question = '';

  void questionChanged(String val) {
    question = val;
  }

  Future askQuestion(BuildContext context) async {
    final data = {
      "productID": args['productID'],
      "question": question,
      "seller_id": args['sellerID'],
    };

    if (question.length == 0) {
      errorPopup(context, "Question cannot be empty");
    } else {
      loadingPopUP(context, "Asking Question");
      final response = await http.post(
        httpUri(serviceTwo, 'qna/buyer/ask_question'),
        headers: tokenHeaderContentType(),
        body: jsonEncode(data),
      );
      if (response.statusCode == 200) {
        args['refresh']();
        Navigator.of(context).pop();
        Navigator.of(context).pop();
        sucessFulPopup(context, "Asked question");
      }
    }
  }
}
