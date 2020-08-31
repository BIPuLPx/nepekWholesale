import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skite_buyer/pages/result/result_state.dart';
import 'package:skite_buyer/styles/appBars/result.dart';

class ResultPage extends StatelessWidget {
  final args;
  ResultPage({this.args});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ResultState>(
        create: (context) => ResultState(), child: ResultMain(args: args));
    //  Center(child: Text(args['query'])),
  }
}

class ResultMain extends StatelessWidget {
  final args;
  ResultMain({this.args});
  @override
  Widget build(BuildContext context) {
    final result = Provider.of<ResultState>(context);
    if (result.fetchedResult == false) {
      result.fetchSearch(args['query']);
    }
    return Scaffold(
      appBar: result.products == true ? resultAppBar(context) : null,
      body: result.result,
      // child: Text(result.result[0]),
      bottomNavigationBar: result.products == true
          ? BottomAppBar(
              child: Container(
                height: 50,
                child: Text('data'),
              ),
            )
          : null,
    );
  }
}
