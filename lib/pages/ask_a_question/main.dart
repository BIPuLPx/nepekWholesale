import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:nepek_buyer/pages/ask_a_question/ask_a_qsn_provider.dart';
import 'package:nepek_buyer/savedData/user_data.dart';
import 'package:nepek_buyer/styles/appBars/default_app_bar.dart';
import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_provider.dart';
import 'package:nepek_buyer/styles/extensions.dart';

class AskaQuestion extends StatelessWidget {
  final args;
  const AskaQuestion({Key key, this.args}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AskaQuestionProvider(),
      child: AskaQuestionRoot(args: args),
    );
  }
}

class AskaQuestionRoot extends StatelessWidget {
  final args;
  const AskaQuestionRoot({Key key, this.args}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final bool darktheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    final AskaQuestionProvider provider = Provider.of(context);
    provider.args = args;
    // print(args);
    return Scaffold(
      appBar: defaultAppBar(context, 'Ask Question', darktheme),
      body: Container(
        margin: EdgeInsets.only(top: 15, left: 15, right: 15),
        child: ListView(
          children: [
            _leftRightData("Product", args['productName']),
            _leftRightData("Question as", UserPreferences().getDisplayName()),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(top: 15),
              color: darktheme ? Colors.grey[800] : Colors.grey[200],
              child: TextFormField(
                autocorrect: false,
                autofocus: true,
                minLines: 2,
                maxLines: 5,
                onChanged: (val) => provider.questionChanged(val),
                // obscureText: obscureText ?? false,
                style: GoogleFonts.poppins(height: 1.3),
                decoration: InputDecoration(
                  labelText: "Write a question",
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: BottomAppBar(
        child: FlatButton(
          height: 50,
          color: Colors.white,
          onPressed: () {
            provider.askQuestion(context);
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Ask",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w700,
                  color: darktheme ? Colors.black : AppColors().primaryBlue(),
                ),
              ),
              SizedBox(width: 10),
              Icon(
                Icons.arrow_forward,
                size: 18,
                color: darktheme ? Colors.black : AppColors().primaryBlue(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _leftRightData(String left, String right) {
    return Container(
      padding: EdgeInsets.only(top: 5, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            left,
            style: _textStyle(true),
          ),
          Flexible(
            child: Text(
              capitalize(right),
              style: _textStyle(false),
            ),
          ),
        ],
      ),
    );
  }

  TextStyle _textStyle(bool gray) => GoogleFonts.poppins(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: gray ? Colors.grey : null);
}
