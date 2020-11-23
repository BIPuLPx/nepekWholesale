import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/font_styles.dart';

class FilterAgain extends StatelessWidget {
  final args;
  FilterAgain({this.args});
  @override
  Widget build(BuildContext context) {
    // print(args);
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilterAgainMsg(child: "No products found for your filter query"),
            SizedBox(height: 10),
            FilterAgainMsg(child: 'Please adjust again'),
            SizedBox(height: 30),
            SizedBox(
              height: 50,
              child: FlatButton(
                color: AppColors().officialMatch(),
                onPressed: () {
                  Navigator.pushNamed(context, 'filter_search_result',
                      arguments: args);
                },
                child: Text(
                  "Filter Again",
                  style: AppFontStyle().button(Colors.white),
                ),
              ),
            )
          ]),
    );
  }
}

class FilterAgainMsg extends StatelessWidget {
  final String child;
  FilterAgainMsg({this.child});
  @override
  Widget build(BuildContext context) {
    return Text(
      child,
      style: GoogleFonts.openSans(fontWeight: FontWeight.w600, fontSize: 17),
    );
  }
}
