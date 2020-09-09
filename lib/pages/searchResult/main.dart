import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skite_buyer/pages/searchResult/result_state.dart';

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
      result.searchText = args['query'];

      result.fetchInitialSearch();
    }
    return Scaffold(
      body: result.result,
    );
  }
}
