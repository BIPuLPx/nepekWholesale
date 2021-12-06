import 'package:flutter/material.dart';
import 'package:nepek_buyer/pages/add_listing/styles/dropdown_container.dart';
import 'package:provider/provider.dart';

import 'classify_provider.dart';

class DropDownLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ClassifyProvider>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DropDownContainer(
          heading: 'Class',
          current: provider.currentdata['class'],
          dataList: provider.classes,
          dropDownChanged: provider.dropdownChanged,
        ),
        DropDownContainer(
          heading: 'Category',
          current: provider.currentdata['category'],
          dataList: provider.categories,
          dropDownChanged: provider.dropdownChanged,
        ),
        DropDownContainer(
          heading: 'Sub Category',
          current: provider.currentdata['subcategory'],
          dataList: provider.subCategories,
          dropDownChanged: provider.dropdownChanged,
        )
      ],
    );
  }
}
