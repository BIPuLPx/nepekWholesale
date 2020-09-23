import 'package:flutter/material.dart';
import 'package:skite_buyer/pages/searchResult/resultLayout/widgets/nested/image_container.dart';
import 'package:skite_buyer/pages/searchResult/resultLayout/widgets/nested/product_name.dart';
import 'package:skite_buyer/pages/searchResult/resultLayout/widgets/nested/product_price.dart';
import 'package:skite_buyer/pages/searchResult/resultLayout/widgets/nested/star_rating.dart';

class GridLayout extends StatelessWidget {
  final int index;
  final result;
  const GridLayout({Key key, this.index, this.result}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'view_product', arguments: {
          'product_id': result.products[index]['_id'].toString(),
          'product_uid': result.products[index]['uid'].toString()
        });
      },
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: GridTile(
          child: Container(
            padding: EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ResultProductImage(),
                SizedBox(height: 10),
                Expanded(
                  child: Container(
                    child: Stack(
                      overflow: Overflow.visible,
                      children: [
                        ProductName(
                            name: result.products[index]['productName']),
                        Positioned(
                            top: 80,
                            child: ProductPrice(
                                price: result.products[index]['price']))
                      ],
                    ),
                  ),
                ),
              ],
            ), //just for testing, will fill with image later
          ),
          footer: Container(
            padding: EdgeInsets.all(5),
            child: Row(
              children: [
                Rating(
                  rating: result.products[index]['rating'].toDouble(),
                  no: result.products[index]['ratingNo'],
                ),
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
