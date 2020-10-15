import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skite_buyer/pages/searchResult/result_provider.dart';

class ResultPage extends StatelessWidget {
  final args;
  ResultPage({this.args});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ResultState>(
        create: (context) => ResultState(), child: ResultRoot(args: args));
  }
}

class ResultRoot extends StatelessWidget {
  final args;
  ResultRoot({this.args});
  @override
  Widget build(BuildContext context) {
    final result = Provider.of<ResultState>(context);
    if (result.initialFetch == false) {
      print(args);
      // result.queryFilter = {...args['queryFilter']};
      result.searchText = args['query'];
      result.fetchInitialSearch();
      result.initialFetch = true;
    }
    return Scaffold(
      body: result.result,
    );
  }
}
