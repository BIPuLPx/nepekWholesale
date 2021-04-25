import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nepek_buyer/styles/appBars/default_app_bar.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_provider.dart';

import 'qnas_provider.dart';

class QnaPage extends StatelessWidget {
  final args;
  const QnaPage({Key key, this.args}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => QnasProvider(),
      child: QnaPageRoot(args: args),
    );
  }
}

class QnaPageRoot extends StatelessWidget {
  final args;
  const QnaPageRoot({Key key, this.args}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<QnasProvider>(context);
    if (provider.initialFetch == false) {
      provider.productId = args['id'];
      provider.productName = args['product'];
      provider.fetchQnas();
    }
    final bool darktheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: defaultAppBar(context, "Qnas", darktheme),
      body: Container(
        child: provider.body,
      ),
    );
  }
}
