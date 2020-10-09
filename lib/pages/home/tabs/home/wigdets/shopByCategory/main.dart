import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skite_buyer/pages/home/tabs/home/wigdets/shopByCategory/nested/shop_by_category_container.dart';
import 'package:skite_buyer/styles/font_styles.dart';

class ShopByCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeFonts().heading('Shop By Category'),
          SizedBox(height: 15),
          Center(
            child: Wrap(
              spacing: 5,
              runSpacing: 5,
              children: [
                ShopByCategoryContainer(label: 'Face Masks'),
                ShopByCategoryContainer(label: 'Face Masks'),
                ShopByCategoryContainer(label: 'Face Masks'),
                ShopByCategoryContainer(label: 'Face Masks'),
                ShopByCategoryContainer(label: 'Face Masks'),
                ShopByCategoryContainer(label: 'Face Masks'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
