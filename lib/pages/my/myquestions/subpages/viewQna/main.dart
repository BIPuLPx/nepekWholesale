import 'package:flutter/material.dart';
import 'package:nepek_buyer/pages/my/myquestions/subpages/viewQna/provider.dart';
import 'package:nepek_buyer/styles/appBars/default_app_bar.dart';
import 'package:provider/provider.dart';

class ViewQna extends StatelessWidget {
  final String id;

  const ViewQna({Key key, this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ViewQnaProvider(),
      child: ViewQnaRoot(id),
    );
  }
}

class ViewQnaRoot extends StatelessWidget {
  final String id;
  ViewQnaRoot(this.id);

  @override
  Widget build(BuildContext context) {
    final ViewQnaProvider provider = Provider.of(context);
    if (!provider.initFetched) provider.getQna(id);
    return Scaffold(
      appBar: defaultAppBar(context, 'Answer', false),
      body: provider.body,
    );
  }
}
