import 'package:flutter/material.dart';
import 'package:nepek_buyer/library/backend_changes/product_changes.dart';
import 'nested/image_container.dart';
import 'nested/product_name.dart';
import 'nested/product_price.dart';
import 'nested/star_rating.dart';
import '../../../../../library/product_class.dart';
import './nested/discounted.dart';

class GridLayout extends StatelessWidget {
  final int index;
  final result;
  const GridLayout({Key key, this.index, this.result}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Product _product = Product(result.products[index]);
    final bool isOff =
        _product.oldPrice != null && _product.oldPrice > _product.price;

    return Material(
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
        child: Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: GridTile(
            child: Container(
              padding: EdgeInsets.all(8),
              child: Stack(
                overflow: Overflow.visible,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ResultProductImage(
                        dir: result.products[index]['uid'],
                        imgName: result.products[index]['thumbnail'],
                      ),
                      SizedBox(height: 10),
                      Expanded(
                        child: Container(
                          child: ProductName(name: _product.productName),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    left: -8,
                    top: -8,
                    child: isOff ? PerOff(off: _product.off) : Container(),
                  ),
                  Positioned(
                    bottom: 60,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProductPrice(price: _product.price),
                        isOff
                            ? OldPrice(price: _product.oldPrice)
                            : Container(),
                      ],
                    ),
                  )
                ], //just for testing, will fill with image later
              ),
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
      ),
    );
  }
}
