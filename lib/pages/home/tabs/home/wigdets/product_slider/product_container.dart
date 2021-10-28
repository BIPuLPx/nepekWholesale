import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/library/product_class.dart';
import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/network_image.dart';
import 'package:nepek_buyer/styles/rating.dart';
import 'package:nepek_buyer/styles/seller_type.dart';
import 'package:nepek_buyer/styles/text/format_price.dart';
import 'package:nepek_buyer/styles/text/normal_text.dart';
import 'package:nepek_buyer/styles/text/trimName.dart';

class ProductContainer extends StatelessWidget {
  final product;
  const ProductContainer({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.40;

    final Product _product = Product(product);
    String of;

    if (_product.oldPrice != null) {
      if (_product.oldPrice > _product.price) {
        of = _product.off;
      }
    }

    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        'view_product',
        arguments: {'product_id': _product.id},
      ),
      child: Container(
        // color: Colors.white,
        margin: EdgeInsets.symmetric(horizontal: 5),
        padding: EdgeInsets.all(5),
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(
            width: 2,
            color: Colors.grey.shade200,
          ),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          // overflow: Overflow.visible,
          children: [
            Column(
              children: [
                Container(
                  child: Stack(
                    children: [
                      NepekImageNetwork(
                        url: _product.minithumbImg,
                        height: 150,
                        // url: '${}',
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: SellerType(type: _product.storeType),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 5),
                _name(_product.productName),

                // SizedBox(height: 10),
                // )
              ],
            ),
            _price(_product.rating, _product.price, _product.oldPrice),
            of == null ? Container() : _perOff(_product.off),
          ],
        ),
      ),
    );
  }
}

Positioned _perOff(String of) {
  return Positioned(
    right: -5,
    top: -5,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
        ),
        color: AppColors.officialMatch,
      ),
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Text(
        of,
        style: GoogleFonts.poppins(
            color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600),
      ),
    ),
  );
}

Text _name(name) {
  return Text(
    trimName(name, 25),
    style: GoogleFonts.poppins(
      // fontWeight: FontWeight.w400,
      fontSize: 14.5,
    ),
  );
}

Positioned _price(rating, price, oldPrice) {
  return Positioned(
    bottom: 0,
    left: 0,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              'NPR  ',
              style: GoogleFonts.poppins(
                  // fontWeight: FontWeight.w600,
                  ),
            ),
            NepekText(
              formatPrice(price),
              fontWeight: FontWeight.w600,
              fontSize: 17,
            ),
          ],
        ),
        oldPrice != null
            ? NepekText(
                formatPrice(oldPrice),
                fontSize: 12,
              )
            : SizedBox(),
        rating == 0
            ? SizedBox()
            : Container(
                margin: EdgeInsets.only(top: 5),
                child: Rating(
                  rating: rating,
                  size: 12,
                ),
              ),
      ],
    ),
  );
}
