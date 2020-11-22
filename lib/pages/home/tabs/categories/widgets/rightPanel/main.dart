import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nepek_buyer/pages/home/tabs/categories/provider/main.dart';
import 'package:nepek_buyer/pages/home/tabs/categories/widgets/rightPanel/categories_and_subcategories/main.dart';

class RightPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final catagoriesAndSubcategories =
        Provider.of<CategoriesState>(context).selectedCategories;
  //  print(catagoriesAndSubcategories);
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: ListView(
          key: ObjectKey(catagoriesAndSubcategories),
          physics:
              BouncingScrollPhysics(),
          children: catagoriesAndSubcategories
              .map((catAndSubCat) =>
                  CategoryAndSubCategories(catAndSubCat: catAndSubCat))
              .toList()),
    );
  }
}
