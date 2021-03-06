import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/library/backend_changes/product_changes.dart';
import 'package:nepek_buyer/library/product_class.dart';
import 'package:nepek_buyer/savedData/apis.dart';
import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/container_with_shadow.dart';
import 'package:nepek_buyer/styles/text/format_price.dart';
import 'package:nepek_buyer/styles/text/normal_text.dart';
import 'package:provider/provider.dart';

import 'wishlists_provider.dart';

class WishListsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final WishListsProvider provider = Provider.of(context);
    return ListView(
      children: provider.wishLists
          .map((product) => productContainer(product, context))
          .toList(),
    );
  }

  Widget productContainer(product, BuildContext context) {
    Product _product = Product(product);
    String of;

    if (_product.oldPrice != null) {
      if (_product.oldPrice > _product.price) {
        of = _product.off;
      }
    }

    return Container(
      margin: EdgeInsets.only(top: 15),
      child: GestureDetector(
        onTap: () async {
          Navigator.pushNamed(context, 'view_product', arguments: {
            'product_id': _product.id.toString(),
          });
          await ProductChanges().increaseClick(_product.id);
        },
        child: Stack(
          children: [
            Container(
              color: Colors.white,
              padding: EdgeInsets.all((10)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAx,
                children: [
                  Image.network(
                    '$imgUrl/productImages/${_product.imgDir}/miniThumbnail/${_product.miniThumb}',
                    height: 100,
                    width: 100,
                  ),
                  SizedBox(width: 20),
                  Flexible(
                    child: Container(
                      child: Text(
                        sliceLongName(_product.productName),
                        style: GoogleFonts.poppins(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            of != null ? _perOff(of) : Container(),
            _pdtprice(of, _product),
          ],
        ),
      ),
    );
  }

  Positioned _pdtprice(String of, Product _product) {
    return Positioned(
      left: 130,
      bottom: 20,
      child: Row(
        children: [
          _price(of, _product),
          SizedBox(width: 10),
          of != null ? _oldPrice(of, _product) : Container()
        ],
      ),
    );
  }

  Positioned _perOff(String of) {
    return Positioned(
      right: 5,
      top: 5,
      child: ShadowContainer(
        shadowColor: Colors.transparent,
        blurRadius: 0,
        spreadRadius: 0,
        // offset: Offset(1, 2),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          color: AppColors.officialMatchLight,
          child: Text(
            of,
            style: GoogleFonts.poppins(
                color: AppColors.officialMatch,
                fontSize: 11,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }

  Row _price(String of, Product _product) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        NepekText(
          formatPrice(_product.price),
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
      ],
    );
  }

  Widget _oldPrice(String of, Product _product) {
    return NepekText(
      formatPrice(_product.oldPrice),
      fontWeight: FontWeight.w600,
      fontSize: 11,
      color: Colors.grey,
      decoration: TextDecoration.lineThrough,
    );
  }
}

String sliceLongName(String name) {
  if (name.length > 35) {
    return name.substring(0, 32) + '.....';
  }
  return name;
}
