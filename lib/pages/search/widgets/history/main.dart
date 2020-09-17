import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:skite_buyer/styles/colors.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SearchHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final searchHistory = Hive.box('search').values.toList();
    return ValueListenableBuilder(
        valueListenable: Hive.box('search').listenable(),
        builder: (context, box, widget) {
          return box.length == 0
              ? Container()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SearchHistoryHeading(),
                    Column(
                      children: searchHistory
                          .map(
                            (term) => HistoryText(text: term),
                          )
                          .toList(),
                    )
                  ],
                );
        });
  }
}

class SearchHistoryHeading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Recents',
            style: TextStyle(
              fontWeight: FontWeight.w800,
            ),
          ),
          InkWell(
            onTap: () {
              Hive.box('search').clear();
            },
            child: Container(
              padding: EdgeInsets.only(top: 5, bottom: 5),
              width: 100,
              child: Text(
                'Clear',
                textAlign: TextAlign.right,
                style: GoogleFonts.rubik(
                  color: AppColors().primaryBlue(),
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HistoryText extends StatelessWidget {
  final String text;
  HistoryText({this.text});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final search = Hive.box('search');
        if (!search.values.toList().contains(text)) {
          search.add(text);
        }
        Navigator.pushReplacementNamed(context, 'result',
            arguments: {'type': 'search', 'query': text});
      },
      child: Container(
        padding: EdgeInsets.all(12.0),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: GoogleFonts.roboto(
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
            Icon(
              Icons.search,
              size: 17,
            ),
          ],
        ),
      ),
    );
  }
}
