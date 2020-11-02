import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:skite_buyer/pages/search/search_provider.dart';
import 'package:skite_buyer/pages/search/appBar.dart';
import 'package:skite_buyer/pages/search/widgets/autoComplete/main.dart';
import 'package:skite_buyer/pages/search/widgets/currentSearch/main.dart';
import 'package:skite_buyer/pages/search/widgets/history/main.dart';

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
        // padding: EdgeInsets.only(left: 20, right: 10, top: 10),
        child: ListView(
          children: [
            searchTerm == '' ? SearchHistory() : CurrentSearch(val: searchTerm),
            // Text('other autocomplete'),
            autocompletes.length == 0 ? Container() : AutoCompletes(),
          ],
        ),
      ),
    );
  }

  // @override
  // void dispose() {
  //   Hive.box('search').close();
  //   super.dispose();
  // }
}
