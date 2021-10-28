import 'package:flutter/material.dart';
import 'package:nepek_buyer/pages/home/tabs/categories/widgets/rightPanel/categories_and_subcategories/nested/sub__category_title.dart';
import 'package:nepek_buyer/pages/home/tabs/categories/widgets/rightPanel/categories_and_subcategories/nested/sub_category_image.dart';
import 'package:nepek_buyer/savedData/apis.dart';

class EachSubCategory extends StatelessWidget {
  final String imgdir;
  final String imgName;
  final String text;
  final String id;
  EachSubCategory({this.text, this.id, this.imgdir, this.imgName});
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 2),
      width: deviceWidth * 0.19,
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, 'result',
                arguments: {'type': 'subcategory', 'query': id, 'name': text});
          },
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SubCategoryImage(
                url: '$imgUrl/subCategoriesImages/$imgdir/$imgName',
              ),
              SubCategoryTitle(title: text),
            ],
          ),
        ),
      ),
    );
  }
}
