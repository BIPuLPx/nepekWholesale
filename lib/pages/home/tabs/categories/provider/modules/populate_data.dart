import 'package:hive/hive.dart';

class PopulateDatas {
  Box classifications = Hive.box('classifications');
  Future populateCategories(String classID) async {
    final allCategories = classifications.get('categories');
    final categoriesFiltered =
        allCategories.where((classs) => classs['class_id'] == classID).toList();

    for (var category in categoriesFiltered) {
      category['subCategories'] = await populateSubcategories(category['_id']);
    }
    return categoriesFiltered;
  }

  Future populateSubcategories(categoryID) async {
    final allSubCategories = classifications.get('subcategories');
    final categoriesFiltered = await allSubCategories
        .where((subcategory) => subcategory['category_id'] == categoryID)
        .toList();
    return categoriesFiltered;
  }
}
