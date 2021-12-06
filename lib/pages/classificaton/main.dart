import 'package:flutter/material.dart';
import 'package:nepek_buyer/pages/classificaton/app_bar.dart';
import 'package:nepek_buyer/pages/classificaton/provider.dart';
import 'package:provider/provider.dart';

import 'widgets/classification_wrapper.dart';

class ClassificationPage extends StatelessWidget {
  final args;
  const ClassificationPage({Key key, this.args}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ClassificationProvider(),
      child: ClassificationPageRoot(args: args),
    );
  }
}

class ClassificationPageRoot extends StatelessWidget {
  final args;
  const ClassificationPageRoot({Key key, this.args}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ClassificationProvider provider = Provider.of(context);
    if (!provider.initState) {
      provider.args = args;
      provider.doInitState();
    }
    return provider.body;
  }
}

class CategoriesLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: categoriesAppBar(context),
      body: ListView(
        children: [
          ClassificationWrapper(),
        ],
      ),
    );
  }
}
