import 'package:flutter/material.dart';

import 'nested/image_container.dart';
import 'nested/product_name.dart';
import 'nested/product_price.dart';
import 'nested/star_rating.dart';

class ListLayout extends StatelessWidget {
  final int index;
  final result;
  const ListLayout({Key key, this.index, this.result}) : super(key: key);
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
        child: GridTile(
          child: Container(
            padding: EdgeInsets.all(5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ResultProductImage(),
                SizedBox(width: 10),
                Expanded(
                  child: Stack(
                    overflow: Overflow.visible,
                    children: [
                      ProductName(name: result.products[index]['productName']),
                      Positioned(
                          top: 90,
                          child: ProductPrice(
                              price: result.products[index]['price']))
                    ],
                  ),
                ),
              ],
            ),
          ),
          footer: Container(
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
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
  }
}
