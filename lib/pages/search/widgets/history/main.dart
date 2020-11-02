import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:skite_buyer/pages/search/widgets/history/widgets/history_heading.dart';
import 'package:skite_buyer/pages/search/widgets/history/widgets/history_text.dart';
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
            : Container(
                margin: EdgeInsets.only(left: 20, right: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SearchHistoryHeading(),
                    Column(
                      children: searchHistory
                          .map((term) => HistoryText(text: term))
                          .toList(),
                    )
                  ],
                ),
              );
      },
    );
  }
}
