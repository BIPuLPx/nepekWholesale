import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/main.dart';

class ResultPage extends StatelessWidget {
  final args;
  ResultPage({this.args});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ResultState>(
      create: (context) => ResultState(),
      child: ResultRoot(args: args),
    );
  }
}

class ResultRoot extends StatelessWidget {
  final args;
  ResultRoot({this.args});
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ResultState>(context);
    if (provider.initialFetch == false) {
      provider.args = args;
      // print(args);
      // provider.queryFilter = {...args['queryFilter'] ?? {}};
      provider.searchText = args['query']['name'];
      provider.fetchInitialSearch();
      provider.initialFetch = true;
    }
    return Scaffold(
      body:
          //  Container(),
          provider.result,
    );
  }
}
