import 'package:nepek_buyer/pages/result/resultLayout/main.dart';
import 'package:nepek_buyer/pages/result/screens/no_products_search.dart';

class FrontEnd {
  Future checkFetchedProducts(int productsLength, String query) async {
    if (productsLength > 0) {
      return ResultLayout();
    } else {
      return NoProductsSearch(query: query);
    }
  }

  Future checkNextPage(Map pages) async {
    if (pages.isEmpty) {
      return false;
    } else if (pages['next'] == null) {
      return false;
    } else {
      return true;
    }
  }
}