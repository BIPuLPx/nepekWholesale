import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/pages/home/tabs/cart/widgets/cartHasItems/nested/cartItemLayout/nested/product_image.dart';
import 'package:nepek_buyer/styles/text/format_price.dart';
import 'package:nepek_buyer/styles/text/normal_text.dart';
import 'package:nepek_buyer/styles/text/trimName.dart';

class CartItemHeader extends StatelessWidget {
  final String name;
  final int price;
  final String imageurl;
  final Map variant;

  CartItemHeader({this.name, this.price, this.imageurl, this.variant});
  @override
  Widget build(BuildContext context) {
    List _variant = [];
    if (variant != null) {
      variant
          .forEach((key, value) => _variant.add({'name': key, 'value': value}));
    }
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductName(name: name),
                SizedBox(height: 10),
                ProductPrice(price: price),
                _variant.length > 0 ? Variant(variant: _variant) : Container(),

                // SizedBox(width: 10),
              ],
            ),
            ProductImage(url: imageurl),
          ]),
    );
  }
}

class Variant extends StatelessWidget {
  const Variant({
    Key key,
    @required List variant,
  })  : _variant = variant,
        super(key: key);

  final List _variant;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _variant
                .map(
                  (e) => NepekText(
                    e['name'],
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                )
                .toList(),
          ),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: _variant
                .map(
                  (e) => NepekText(
                    e['value'],
                    fontSize: 12,
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

class ProductName extends StatelessWidget {
  final String name;
  ProductName({this.name});
  @override
  Widget build(BuildContext context) {
    return Text(
      trimName(name, 30),
      style: GoogleFonts.poppins(
        fontWeight: FontWeight.w500,
        height: 1.3,
      ),
    );
  }
}

class ProductPrice extends StatelessWidget {
  final int price;
  ProductPrice({this.price});
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'NPR ',
          style: GoogleFonts.poppins(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            // color: Colors.black54,
          ),
        ),
        NepekText(
          formatPrice(price),
          fontSize: 13,
          // fontWeight: FontWeight.w600,
        ),
        SizedBox(width: 10),
        NepekText(
          '(VAT included)',
          fontSize: 10,
          color: Colors.grey[600],
        )
      ],
    );
  }
}
