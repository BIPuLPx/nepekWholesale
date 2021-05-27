import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/library/product_class.dart';
import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/container_with_shadow.dart';
import 'package:nepek_buyer/styles/network_image.dart';
import 'package:nepek_buyer/styles/text/normal_text.dart';

class ProductContainer extends StatelessWidget {
  final product;
  const ProductContainer({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.40;

    final Product _product = Product(product);

    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, 'view_product',
          arguments: {'product_id': _product.id}),
      child: Container(
        // color: Colors.white,
        margin: EdgeInsets.symmetric(horizontal: 5),
        padding: EdgeInsets.all(5),
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 2,
            color: Colors.grey.shade200,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NepekImageNetwork(
                  url:
                      '${_product.imgUrl}/productImages/${_product.imgDir}/miniThumbnail/${_product.miniThumb}',
                ),
                SizedBox(height: 10),
                _name(_product.productName),
                SizedBox(height: 10),
                // )
              ],
            ),
            _price(_product.price, _product.oldPrice),
            _product.off == null ? Container() : _perOff(_product.off),
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
    child: ShadowContainer(
      shadowColor: AppColors.perOff,
      blurRadius: 0.5,
      spreadRadius: 0.05,
      offset: Offset(-1, 1),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        color: AppColors.perOff,
        child: Text(
          of,
          style: GoogleFonts.poppins(
              color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600),
        ),
      ),
    ),
  );
}

Text _name(name) {
  return Text(
    sliceLongName(name),
    style: GoogleFonts.poppins(
      // fontWeight: FontWeight.w400,
      fontSize: 13,
    ),
  );
}

Positioned _price(price, oldPrice) {
  return Positioned(
    bottom: 0,
    left: 0,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        oldPrice == null
            ? Container()
            : Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  NepekText(
                    'NPR ${oldPrice.toString()}.00',
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                  ),
                ],
              ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              'NPR  ',
              style: GoogleFonts.poppins(
                fontSize: 12,
              ),
            ),
            Text(
              '${price.toString()}.00',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

String sliceLongName(String name) {
  if (name.length > 35) {
    return name.substring(0, 32) + '.....';
  }
  return name;
}
