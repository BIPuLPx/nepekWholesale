import 'package:flutter/material.dart';
import 'package:nepek_buyer/pages/home/tabs/categories/widgets/rightPanel/categories_and_subcategories/nested/sub__category_title.dart';
import 'package:nepek_buyer/pages/home/tabs/categories/widgets/rightPanel/categories_and_subcategories/nested/sub_category_image.dart';

class EachSubCategory extends StatelessWidget {
  final String text;
  final String id;
  EachSubCategory({this.text, this.id});
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(6),
      // color: Colors.grey,
      width: deviceWidth * 0.16,
      child: Material(
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, 'result',
                arguments: {'type': 'subcategory', 'query': id, 'name': text});
          },
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SubCategoryImage(
                url:
                    'https://love4bags.co.uk/wp-content/uploads/2018/11/testss.jpg',
              ),
              SubCategoryTitle(title: text),
            ],
          ),
        ),
      ),
    );
  }
}
