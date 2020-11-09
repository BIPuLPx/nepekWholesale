import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nepek_buyer/pages/result/provider/main.dart';

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
      result.args = args;
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
