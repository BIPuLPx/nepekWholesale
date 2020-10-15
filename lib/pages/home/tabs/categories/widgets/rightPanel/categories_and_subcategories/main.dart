import 'package:flutter/material.dart';

import 'nested/category_heading.dart';
import 'nested/sub_categories.dart';

class CategoryAndSubCategories extends StatelessWidget {
  final Map catAndSubCat;
  CategoryAndSubCategories({this.catAndSubCat});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: Mai,
        children: [
          Align(
            child: CategoryHeading(heading: catAndSubCat['label']),
          alignment: Alignment.topLeft,
          ),
          SubCategories(
            subCategories: catAndSubCat['subCategories'],
          )
        ],
      ),
    );
  }
}
