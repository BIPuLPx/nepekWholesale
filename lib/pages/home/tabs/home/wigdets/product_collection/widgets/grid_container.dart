import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/library/product_class.dart';
import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/container_with_shadow.dart';
import 'package:nepek_buyer/styles/network_image.dart';
import 'package:nepek_buyer/styles/seller_type.dart';
import 'package:nepek_buyer/styles/text/format_price.dart';
import 'package:nepek_buyer/styles/text/normal_text.dart';
import 'package:nepek_buyer/styles/text/trimName.dart';

class GridContainer extends StatelessWidget {
  final Map data;

  const GridContainer({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final _product = Product(data);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Stack(
        // overflow: Overflow.visible,
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(
              context,
              'view_product',
              arguments: {'product_id': data['_id']},
            ),
            child: Container(
              padding: EdgeInsets.all(10),
              width: deviceWidth * 0.42,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      NepekImageNetwork(
                        url: _product.minithumbImg,
                        height: 80,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  _name(_product.productName),
                  SizedBox(height: 15),
                  _price(_product.price),
                  _product.oldPrice != null
                      ? _oldPrice(_product.oldPrice)
                      : SizedBox()
                ],
              ),
            ),
          ),
          _product.oldPrice != null
              ? Positioned(
                  right: 0,
                  child: _perOff(_product.off),
                )
              : SizedBox(),
          Positioned(
            bottom: 5,
            right: 5,
            child: SellerType(type: _product.storeType),
          )
        ],
      ),
    );
  }
}

_oldPrice(price) {
  return Container(
    // margin: EdgeInsets.only(top: 5),
    child: NepekText(
      formatPrice(price),
      fontSize: 12,
      decoration: TextDecoration.lineThrough,
      color: Colors.grey,
    ),
  );
}

Text _name(name) {
  return Text(
    trimName(name, 25),
    style: GoogleFonts.poppins(
      // fontWeight: FontWeight.w400,
      fontSize: 13,
    ),
  );
}

Widget _price(price) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.baseline,
    textBaseline: TextBaseline.alphabetic,
    children: [
      Text(
        'NPR  ',
        style: GoogleFonts.poppins(
          fontSize: 12,
          // fontWeight: FontWeight.w600,
        ),
      ),
      NepekText(
        formatPrice(price),
        fontSize: 13,
      ),
    ],
  );
}

Widget _perOff(String of) {
  return ShadowContainer(
    shadowColor: Colors.transparent,
    blurRadius: 0.5,
    spreadRadius: 0.05,
    offset: Offset(-1, 1),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      color: AppColors.officialMatch,
      child: Text(
        of,
        style: GoogleFonts.poppins(
            color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600),
      ),
    ),
  );
}

String sliceLongName(String name) {
  if (name.length > 35) {
    return name.substring(0, 32) + '.....';
  }
  return name;
}
