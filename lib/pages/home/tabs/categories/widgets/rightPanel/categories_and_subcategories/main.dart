import 'package:flutter/material.dart';
import 'package:skite_buyer/pages/home/tabs/categories/widgets/rightPanel/categories_and_subcategories/nested/category_heading.dart';
import 'package:skite_buyer/pages/home/tabs/categories/widgets/rightPanel/categories_and_subcategories/nested/sub_categories.dart';

class CategoryAndSubCategories extends StatelessWidget {
  final Map catAndSubCat;
  CategoryAndSubCategories({this.catAndSubCat});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategoryHeading(heading: catAndSubCat['name']),
          SubCategories(
            subCategories: catAndSubCat['subCategories'],
          )
        ],
      ),
    );
  }
}
