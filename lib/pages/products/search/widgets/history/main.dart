import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nepek_buyer/pages/products/search/widgets/history/widgets/history_heading.dart';
import 'widgets/history_text.dart';

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
