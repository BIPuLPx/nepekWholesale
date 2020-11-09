import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/pages/products/viewProduct/widgets/productQnas/nested/qna_layout.dart';
import 'package:provider/provider.dart';
import 'package:nepek_buyer/savedData/apis.dart';
import 'package:nepek_buyer/savedData/user_data.dart';
import 'package:nepek_buyer/styles/appBars/default_app_bar.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_provider.dart';
import 'package:nepek_buyer/styles/popUps/loading_popup.dart';
import 'package:http/http.dart' as http;

class MyQuestionsProvider with ChangeNotifier {
  bool initFetch = false;
  Widget body = spinkit;
  List myQnas;

  Future fetchQna() async {
    // print('here');
    final response = await http.get(
      '$productApi/qna/buyer/own_qnas?type=normal',
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
      body = Text('NO QNAs');
    }
    initFetch = true;
    notifyListeners();
  }
}

class MyQnasLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MyQuestionsProvider provider = Provider.of(context);
    final bool darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    return ListView(
      physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      children: <Widget>[
            SizedBox(
              height: 15,
            ),
          ] +
          provider.myQnas
              .map<Widget>(
                (qna) => Container(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  color: darkTheme ? Colors.black : Colors.white,
                  child: InkWell(
                    onTap: () => Navigator.pushNamed(context, 'view_product',
                        arguments: {
                          'product_id': qna['productID'],
                        }),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _productName(qna),
                        SizedBox(height: 15),
                        QnaLayout(
                          question: {
                            'text': qna['question'],
                            'date': qna['questionedIn'],
                            'name': ''
                          },
                          answer: {
                            'text': qna['answer'],
                            'date': qna['answeredIn']
                          },
                          index: provider.myQnas.indexOf(qna),
                          length: provider.myQnas.length,
                        ),
                      ],
                    ),
                  ),
                ),
              )
              .toList(),
    );
  }

  Text _productName(qna) {
    return Text(
      qna['name'],
      style: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        // color: Colors.grey,
      ),
    );
  }
}

class MyQuestions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyQuestionsProvider(),
      child: MyQuestionsRoot(),
    );
  }
}

class MyQuestionsRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MyQuestionsProvider provider = Provider.of(context);
    final bool darktheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    if (provider.initFetch == false) {
      provider.fetchQna();
    }
    return Scaffold(
      appBar: defaultAppBar(context, "My Questions", darktheme),
      body: provider.body,
    );
  }
}
