import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../checkout_provider.dart';

class CheckoutLayoutCalculations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CheckoutProvider provider = Provider.of(context);
    final List products = provider.args['products'];
    final String items = products.length == 1 ? 'item' : 'items';
    return Column(
      children: [
        _mainHeading("Products", 'Price'),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: products
              .map<Widget>(
                (e) => _checkoutCalculations(
                  e['productName'],
                  'NPR ${e['price']}.00',
                  products.indexOf(e),
                  products.length,
                ),
              )
              .toList(),
        ),
        _mainHeading("Total (${products.length} $items)",
            'NPR ${provider.totalPrice.toString()}.00'),
            Align(
              alignment: Alignment.bottomRight,
              child: Text('( inclusive of VAT )',style: GoogleFonts.poppins(),))
      ],
    );
  }

  Container _checkoutCalculations(
      String left, String right, int index, int totalItems) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Container(
                  margin: EdgeInsets.only(right: 30),
                  child: Text(left, style: _bill(false)),
                ),
              ),
              Text(right, style: _bill(false)),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 8, bottom: 8),
            height: index == totalItems - 1 ? 0 : 1.2,
            color: Colors.grey,
          )
        ],
      ),
    );
  }

  TextStyle _bill(bool mainHeading) => GoogleFonts.poppins(
        fontWeight: mainHeading ? FontWeight.w500 : FontWeight.w400,
        fontSize: mainHeading ? 19 : 15,
      );

  Container _mainHeading(String left, String right) {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(left, style: _bill(true)),
          Text(right, style: _bill(true)),
        ],
      ),
    );
  }
}
