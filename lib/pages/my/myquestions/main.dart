import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/pages/products/viewProduct/widgets/productQnas/nested/qna_layout.dart';
import 'package:provider/provider.dart';
import 'package:nepek_buyer/styles/appBars/default_app_bar.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_provider.dart';
import 'provider.dart';

class MyQnasLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MyQuestionsProvider provider = Provider.of(context);
    final bool darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    return ListView(
      physics: BouncingScrollPhysics(),
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
      backgroundColor: Colors.white,
      appBar: defaultAppBar(context, "My Questions", darktheme),
      body: provider.body,
    );
  }
}
