import 'package:flutter/material.dart';
import 'package:nepek_buyer/pages/products/search/appBar.dart';
import 'package:provider/provider.dart';

import 'search_provider.dart';
import 'widgets/autoComplete/main.dart';
import 'widgets/currentSearch/main.dart';
import 'widgets/history/main.dart';


class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context) => SearchState()),
      child: SearchPageRoot(),
    );
  }
}

class SearchPageRoot extends StatefulWidget {
  @override
  _SearchPageRootState createState() => _SearchPageRootState();
}

class _SearchPageRootState extends State<SearchPageRoot> {
  var currentSuffix = Icons.search;
  var searchTerm = '';
  final TextEditingController _searchHolder = TextEditingController();

  setSearchTerm(val) {
    setState(() {
      val == '' ? currentSuffix = Icons.search : currentSuffix = Icons.cancel;
      searchTerm = val.trim();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SearchState>(context);
    final autocompletes = provider.autoCompletes;

    return Scaffold(
      appBar: searchAppBar(
          context, currentSuffix, searchTerm, setSearchTerm, _searchHolder),
      body: Container(
        child: ListView(
          children: [
            searchTerm == '' ? SearchHistory() : CurrentSearch(val: searchTerm),
            autocompletes.length == 0 ? Container() : AutoCompletes(),
          ],
        ),
      ),
    );
  }

}
