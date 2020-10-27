import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skite_buyer/styles/appBars/default_app_bar.dart';
import 'package:skite_buyer/styles/darkThemes/dark_theme_provider.dart';

class CheckOut extends StatelessWidget {
  final args;

  const CheckOut({Key key, this.args}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print(args);
    final DarkThemeProvider darktheme = Provider.of(context);
    List products = args['products'];
    return Scaffold(
      appBar: defaultAppBar(context, 'Checkout', darktheme.darkTheme),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: products.map(
              (e) {
                return Text(e['productName']);
              },
            ).toList(),
          )
        ],
      ),
    );
  }
}
