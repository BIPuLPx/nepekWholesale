import 'package:flutter/material.dart';
import 'package:nepek_buyer/pages/home/tabs/categories/widgets/rightPanel/categories_and_subcategories/nested/each_subcategory.dart';

class SubCategories extends StatelessWidget {
  final List subCategories;
  SubCategories({this.subCategories});
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: subCategories
          .map(
            (subCategory) => EachSubCategory(
              text: subCategory['label'],
              id: subCategory['_id'],
            ),
          )
          .toList(),
    );
  }
}
