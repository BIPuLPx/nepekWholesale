import 'package:http/http.dart';
import 'package:nepek_buyer/savedData/apis.dart';
import 'package:nepek_buyer/savedData/httpUri.dart';

class ProductChanges {
  Future<int> increaseClick(String productID) async {
    final response = await put(
        httpUri(productApi, 'products/cr_up_dl/update_clicks/$productID'));
    return response.statusCode;
  }
}
