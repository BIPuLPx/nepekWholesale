import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/library/product_class.dart';
import 'package:nepek_buyer/pages/home/tabs/home/wigdets/product_slider/product_image.dart';
import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/container_with_shadow.dart';

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

    return Container(
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
      ),
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Column(
            children: [
              ProductImage(),
              SizedBox(height: 5),
              _name(_product.productName),
              SizedBox(height: 10),
              // )
            ],
          ),
          _price(_product.price),
          of == null ? Container() : _perOff(_product.off),
        ],
      ),
    );
  }
}

Positioned _perOff(String of) {
  return Positioned(
    right: -5,
    top: -5,
    child: ShadowContainer(
      shadowColor: AppColors().officialMatch(),
      blurRadius: 0.5,
      spreadRadius: 0.05,
      offset: Offset(-1, 1),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        color: AppColors().officialMatch(),
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

Positioned _price(price) {
  return Positioned(
    bottom: 0,
    left: 0,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      children: [
        Text(
          'NPR  ',
          style: GoogleFonts.poppins(
            fontSize: 12,
            // fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          '${price.toString()}.00',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
          ),
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
