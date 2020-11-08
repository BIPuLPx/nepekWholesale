import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nepek_buyer/pages/home/tabs/categories/provider/main.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_provider.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CategoriesState>(
      create: (context) => CategoriesState(),
      builder: (context, child) => CategoriesRoot(),
    );
  }
}

class CategoriesRoot extends StatefulWidget {
  @override
  _CategoriesRootState createState() => _CategoriesRootState();
}

class _CategoriesRootState extends State<CategoriesRoot>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final classify = Provider.of<CategoriesState>(context);
    if (classify.initState == false) {
      classify.doInitState();
    }
    final bool darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    return Scaffold(
        backgroundColor: darkTheme ? Colors.black : Colors.white,
        body: classify.body);
  }

  @override
  bool get wantKeepAlive => true;
}
