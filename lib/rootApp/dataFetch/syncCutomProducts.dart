import 'package:http/http.dart';
import 'package:nepek_buyer/rootApp/dataFetch/main.dart';
import 'package:nepek_buyer/savedData/apis.dart';
import 'package:nepek_buyer/savedData/user_data.dart';

class SyncCustomProducts {
  final _injectDatas = InjectDatas();

  Future syncWishListsWithBackend() async {
    final bool isUptoDate = await _injectDatas.testCustomProducts('wishlist');
    if (!isUptoDate) {
      return await _injectDatas.getCustomProducts('wishlist');
    }
  }

  Future crdlCustomProducts(String productID, String crdl) async {
    final response = await put(
        '$productApi/custom_products/$crdl?type=wishlist&key=$productID',
        headers: {
          'Authorization': 'Bearer ${UserPreferences().getJwtToken()}'
        });
    if (response.statusCode == 200) {
      return await syncWishListsWithBackend();
    }
  }
}
