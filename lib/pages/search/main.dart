import 'package:flutter/material.dart';
import 'package:skite_buyer/styles/appBars/search.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var currentSuffix = Icons.search;
  var searchTerm = '';
  final TextEditingController _searchHolder = TextEditingController();

  setSearchTerm(val) {
    setState(() {
      val == '' ? currentSuffix = Icons.search : currentSuffix = Icons.cancel;
      searchTerm = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: searchAppBar(
          context, currentSuffix, searchTerm, setSearchTerm, _searchHolder),
      body: Text('Search'),
    );
  }
}
