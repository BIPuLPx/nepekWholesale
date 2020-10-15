import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skite_buyer/pages/home/tabs/categories/provider/main.dart';
import 'package:skite_buyer/pages/home/tabs/categories/widgets/leftPanel/main.dart';
import 'package:skite_buyer/pages/home/tabs/categories/widgets/rightPanel/main.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CategoriesState>(
      create: (context) => CategoriesState(),
      builder: (context, child) => CategoriesRoot(),
    );
  }
}

class CategoriesRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final classify = Provider.of<CategoriesState>(context);
    if (classify.initState == false) {
      classify.doInitState();
    }
    return classify.body;
  }
}
