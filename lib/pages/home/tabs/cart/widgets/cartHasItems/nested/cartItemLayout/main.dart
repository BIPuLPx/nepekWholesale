import 'package:flutter/material.dart';
import 'package:nepek_buyer/pages/home/tabs/cart/cart_state.dart';
import 'package:nepek_buyer/pages/home/tabs/cart/widgets/cartHasItems/nested/cartItemLayout/nested/footer.dart';
import 'package:nepek_buyer/pages/home/tabs/cart/widgets/cartHasItems/nested/cartItemLayout/nested/header.dart';
import 'package:nepek_buyer/styles/button/nepek_icon_button.dart';
import 'package:nepek_buyer/styles/text/normal_text.dart';
import 'package:provider/provider.dart';

class CartItemLayout extends StatelessWidget {
  final Map item;
  CartItemLayout({this.item});
  @override
  Widget build(BuildContext context) {
    final CartState provider = Provider.of(context);
    final Map product = item['item'];
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, 'view_product',
          arguments: {'product_id': product['productID']}),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey[300],
            ),
            borderRadius: BorderRadius.circular(10),
            boxShadow: []),
        margin: EdgeInsets.only(top: 10, left: 5, right: 5),
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 5),
              child: GestureDetector(
                onTap: () => Navigator.pushNamed(
                  context,
                  'view_product',
                  arguments: {'product_id': product['productID']},
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CartItemHeader(
                        name: product['name'],
                        price: product['price'],
                        variant: product['variant'],
                        imageurl:
                            '${product['imgUrl']}/productImages/${product['imgDir']}/miniThumbnail/${product['miniThumb']}',
                      ),
                      product['av'] == false
                          ? SizedBox()
                          : CartItemFooter(
                              index: item['index'],
                              quantity: product['qty'],
                              totalQty: product['totalQty'],
                            )
                    ]),
              ),
            ),
            product['av'] == false
                ? Positioned.fill(
                    child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ))
                : Container(),
            product['av'] == false
                ? Positioned(
                    top: 10,
                    right: 10,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        NepekText(
                          "Product is not available",
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(width: 20),
                        NepekIconButton(
                          Icons.clear_rounded,
                          onClick: () => provider.deleteItem(item['index']),
                          size: 8,
                          // reversed: true,
                        ),
                      ],
                    ),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
