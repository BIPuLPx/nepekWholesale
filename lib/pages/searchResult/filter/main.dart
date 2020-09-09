import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skite_buyer/pages/searchResult/filter/filter_state.dart';
import 'package:skite_buyer/pages/searchResult/filter/styles/appBar.dart';
import 'package:skite_buyer/pages/searchResult/filter/styles/filter_entities_container.dart';

class SearchFilterPage extends StatelessWidget {
  final args;
  SearchFilterPage({this.args});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FilterSearchState>(
        create: (context) => FilterSearchState(),
        child: FilterPageRoot(args: args));
  }
}

class FilterPageRoot extends StatelessWidget {
  final args;
  FilterPageRoot({this.args});
  @override
  Widget build(BuildContext context) {
    print(args);
    return Scaffold(
      appBar: filterAppBar(context),
      body: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilterItemContainer(text: 'Price', route: 'filter_price'),
            FilterItemContainer(text: 'Brand')
          ],
        ),
      ),
    );
  }
}
