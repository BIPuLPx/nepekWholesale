import 'package:flutter/material.dart';
import 'package:nepek_buyer/styles/button/nepek_button.dart';
import 'package:nepek_buyer/styles/button/nepek_button_icon.dart';
import 'package:nepek_buyer/styles/text/left_right_data.dart';
import 'package:nepek_buyer/styles/text/nepek_text_input.dart';
import 'package:provider/provider.dart';
import 'package:nepek_buyer/savedData/user_data.dart';
import 'package:nepek_buyer/styles/appBars/default_app_bar.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_provider.dart';
import 'ask_a_qsn_provider.dart';

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
    // final width = MediaQuery.of(context).size.width * 0.5;
    // print(args);
    return Scaffold(
      appBar: defaultAppBar(context, 'Ask Question', darktheme),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(top: 15, left: 15, right: 15),
        child: ListView(
          children: [
            leftRightData(
              "Product",
              args['productName'],
              fontWeight: FontWeight.w500,
            ),
            leftRightData(
              "Question as",
              UserPreferences().getDisplayName(),
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: 40),
            NepekTextInput(
              background: true,
              onChanged: (val) => provider.questionChanged(val),
              minlines: 3,
              maxlines: 5,
              labelText: "Write a question",
              autofocus: true,
            )

            // onChanged: (val) => provider.questionChanged(val),
          ],
        ),
      ),
      floatingActionButton: NepekButton(
        width: 150,
        icon: NepekButtonIcon(
          Icons.question_answer_outlined,
        ),
        iconReverse: true,
        onClick: () => provider.askQuestion(context),
        label: "Ask",
      ),
    );
  }
}
