import 'package:flutter/material.dart';
import 'package:nepek_buyer/library/backend_changes/product_changes.dart';
import '../../../../../library/product_class.dart';
import 'nested/image_container.dart';
import 'nested/product_name.dart';
import 'nested/product_price.dart';
import 'nested/star_rating.dart';
import './nested/discounted.dart';

class ListLayout extends StatelessWidget {
  final int index;
  final result;
  const ListLayout({Key key, this.index, this.result}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Product _product = Product(result.products[index]);
    final bool isOff =
        _product.oldPrice != null && _product.oldPrice > _product.price;

    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: () {
          ProductChanges()
              .increaseClick(result.products[index]['_id'])
              .then((value) {
            if (value == 200) {
              Navigator.pushNamed(context, 'view_product', arguments: {
                'product_id': result.products[index]['_id'].toString(),
                'product_uid': result.products[index]['uid'].toString()
              });
            }
          });
        },
        child: GridTile(
          child: Container(
            padding: EdgeInsets.all(5),
            child: Stack(
              overflow: Overflow.visible,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ResultProductImage(
                      url: result.products[index]['imgUrl'],
                      dir: result.products[index]['imgDir'],
                      imgName: result.products[index]['miniThumb'],
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Stack(
                        overflow: Overflow.visible,
                        children: [
                          ProductName(
                              name: result.products[index]['productName']),
                          Positioned(
                              top: 90,
                              child: Column(
                                children: [
                                  ProductPrice(price: _product.price),
                                  isOff
                                      ? OldPrice(price: _product.oldPrice)
                                      : Container()
                                ],
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  left: -5,
                  top: -5,
                  child: isOff ? PerOff(off: _product.off) : Container(),
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
