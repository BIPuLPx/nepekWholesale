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

    return Container(
      // margin: EdgeInsets.only(top: 10),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        child: InkWell(
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          onTap: () async {
            await ProductChanges().increaseClick(result.products[index]['_id']);
            Navigator.pushNamed(context, 'view_product', arguments: {
              'product_id': result.products[index]['_id'].toString()
            });
          },
          child: GridTile(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Stack(
                clipBehavior: Clip.none,
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
                          clipBehavior: Clip.none,
                          children: [
                            ProductName(
                                name: result.products[index]['productName']),
                            Positioned(
                                top: 90,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    left: -10,
                    top: -10,
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
      ),
    );
  }
}
