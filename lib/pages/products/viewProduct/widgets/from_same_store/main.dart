import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/pages/products/viewProduct/view_product_state.dart';
import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/text/normal_text.dart';
import 'package:provider/provider.dart';

import 'product_container.dart';

// RandomColor _randomColor = RandomColor();

class FromSameStore extends StatefulWidget {
  @override
  _FromSameStoreState createState() => _FromSameStoreState();
}

class _FromSameStoreState extends State<FromSameStore>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final ViewProductState provider = Provider.of(context);

    final height = MediaQuery.of(context).size.height * 0.33;
    super.build(context);
    return provider.storeProducts.length > 2
        ? Container(
            padding: EdgeInsets.symmetric(vertical: 15),
            color: Colors.white,
            margin: EdgeInsets.only(top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 10, left: 15),
                  child: Row(
                    children: [
                      NepekText(
                        "From same store",
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(width: 5),
                      Icon(
                        Icons.storefront_rounded,
                        size: 20,
                        color: AppColors.primaryBlue,
                      )
                    ],
                  ),
                ),
                Container(
                  height: height,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[SizedBox(width: 5)] +
                        provider.storeProducts
                            .map(
                                (product) => ProductContainer(product: product))
                            .toList(),
                  ),
                ),
              ],
            ),
          )
        : SizedBox();
  }

  @override
  bool get wantKeepAlive => true;
}

final testProduct = {
  'productName':
      "Test for sale and nothing fbhjhbnsdf uisdhf hsdfjhhdfs hsdfhnkdfsjh hdfskuidfis kuhjdfskuhkfds khsfdjudhfs ksdfjuhkhfdks",
  'price': 1000,
  'oldPrice': 1500
};
