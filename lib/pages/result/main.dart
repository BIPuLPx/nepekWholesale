import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skite_buyer/pages/result/result_state.dart';

class ResultPage extends StatelessWidget {
  final args;
  ResultPage({this.args});
  @override
  Widget build(BuildContext context) {
    final result = Provider.of<ResultState>(context);
    if (result.fetchedResult == false) {
      result.fetchSearch(args['query']);
    }
    return Scaffold(
      body: result.result,
    );
  }
}
