import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skite_buyer/pages/home/tabs/categories/categoriesprovider.dart';
import 'package:skite_buyer/pages/home/tabs/categories/widgets/rightPanel/categories_and_subcategories/main.dart';

class RightPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final catagoriesAndSubcategories =
        Provider.of<CategoriesState>(context).categoriesForClasses;
    return Container(
      padding: EdgeInsets.only(left: 27, right: 27),
      child: ListView(
          key: ObjectKey(catagoriesAndSubcategories),
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          children: catagoriesAndSubcategories
              .map((catAndSubCat) =>
                  CategoryAndSubCategories(catAndSubCat: catAndSubCat))
              .toList()),
    );
  }
}
