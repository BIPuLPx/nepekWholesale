import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skite_buyer/pages/home/tabs/cart/widgets/cartHasItems/nested/cartItemLayout/nested/product_image.dart';
import 'package:skite_buyer/styles/extensions.dart';

class CartItemHeader extends StatelessWidget {
  final String name;
  final String price;
  final String imageurl;
  CartItemHeader({this.name, this.price, this.imageurl});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(child: ProductName(name: name)),
              SizedBox(width: 10),
              ProductImage(url: imageurl),
            ],
          ),
          ProductPrice(price: price)
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
      capitalize(name),
      style: GoogleFonts.quicksand(
        fontWeight: FontWeight.w500,
        height: 1.3,
      ),
    );
  }
}

class ProductPrice extends StatelessWidget {
  final String price;
  ProductPrice({this.price});
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'NPR ',
          style: GoogleFonts.quicksand(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            // color: Colors.black54,
          ),
        ),
        Text(
          '$price.00',
          style: GoogleFonts.quicksand(
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(width: 10),
        Text(
          '(VAT included)',
          style: GoogleFonts.robotoCondensed(fontSize: 11.2),
        )
      ],
    );
  }
}
