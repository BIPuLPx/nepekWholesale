import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:nepek_buyer/pages/products/search/layout.dart';
import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_provider.dart';
import 'package:provider/provider.dart';

import 'search_provider.dart';
import 'widgets/autoComplete/main.dart';
import 'widgets/currentSearch/main.dart';
import 'widgets/history/main.dart';

class SearchPage extends StatelessWidget {
  final args;
  const SearchPage({Key key, this.args}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context) => SearchState()),
      child: SearchPageRoot(),
    );
  }
}

class SearchPageRoot extends StatelessWidget {
  final args;

  const SearchPageRoot({Key key, this.args}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SearchState provider = Provider.of(context);
    if (!provider.initState) provider.args = args;
    return SearchPageLayout();

    // {
    //   "for":"",
    //   "query":""
    // }
  }
}
