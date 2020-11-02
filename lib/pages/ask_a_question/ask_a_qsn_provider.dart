import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:skite_buyer/savedData/apis.dart';
import 'package:skite_buyer/savedData/user_data.dart';
import 'package:skite_buyer/styles/popUps/errorPopUp.dart';
import 'package:http/http.dart' as http;
import 'package:skite_buyer/styles/popUps/loading_popup.dart';
import 'package:skite_buyer/styles/popUps/sucessPopup.dart';

class AskaQuestionProvider with ChangeNotifier {
  var args;
  String question;

  void questionChanged(String val) {
    question = val;
  }

  Future askQuestion(BuildContext context) async {
    final data = {
      "productID": args['productID'],
      "question": question,
      "buyer_id": UserPreferences().getBuyerKey(),
      "seller_id": args['sellerID'],
      "productName": args['productName'],
      "qsnBy": UserPreferences().getDisplayName()
    };

    if (question.isEmpty) {
      errorPopup(context, "Question cannot be empty");
    } else {
      loadingPopUP(context, "Asking Question");
      print(data);
      final response = await http.post(
        '$productApi/qna/buyer/ask_question',
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
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
