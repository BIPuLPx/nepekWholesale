import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:nepek_buyer/pages/my/myquestions/main.dart';
import 'package:nepek_buyer/savedData/httpUri.dart';
import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/spinkit.dart';
import 'package:nepek_buyer/savedData/apis.dart';
import 'package:nepek_buyer/savedData/user_data.dart';
import 'package:http/http.dart' as http;
import 'package:nepek_buyer/styles/text/normal_text.dart';

class MyQuestionsProvider with ChangeNotifier {
  bool initFetch = false;
  Widget body = logoLoader();
  List myQnas;

  Future fetchQna() async {
    // print('here');
    final response = await http.get(
      httpUri(productApi, 'qna/buyer/own_qnas?type=normal'),
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
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          SizedBox(height: 200),
          Image.asset(
            'assets/others/no_qnas.png',
            height: 150,
          ),
          SizedBox(height: 30),
          NepekText(
            'No QNAs',
            fontSize: 25,
            fontWeight: FontWeight.w500,
            color: AppColors.officialMatch,
          ),
        ],
      ),
    );
  }
}
