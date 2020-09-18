import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skite_buyer/pages/home/tabs/categories/categoriesprovider.dart';
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
    final totalWidth = MediaQuery.of(context).size.width;
    final classify = Provider.of<CategoriesState>(context);
    if (classify.initState == false) {
      classify.doInitState();
    }
    return SafeArea(
      child: Container(
        child: Row(
          children: [
            SizedBox(
              width: totalWidth * 0.3,
              child: LeftPanel(),
            ),
            SizedBox(
              width: totalWidth * 0.7,
              child: RightPanel(),
            )
          ],
        ),
      ),
    );
  }
}
