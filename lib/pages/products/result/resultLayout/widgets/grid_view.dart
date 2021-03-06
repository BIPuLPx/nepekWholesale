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

    return Stack(
      // fit: StackFit.v,
      children: [
        Material(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          child: InkWell(
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            onTap: () async {
              Navigator.pushNamed(context, 'view_product', arguments: {
                'product_id': result.products[index]['_id'].toString()
              });
              await ProductChanges()
                  .increaseClick(result.products[index]['_id']);
            },
            child: GridTile(
              child: Container(
                padding: EdgeInsets.all(8),
                child: Stack(
                  clipBehavior: Clip.none,
                  // overflow: Overflow.visible,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ResultProductImage(
                          url: result.products[index]['imgUrl'],
                          dir: result.products[index]['imgDir'],
                          imgName: result.products[index]['miniThumb'],
                          sellerType: _product.storeType,
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
      ],
    );
  }
}
