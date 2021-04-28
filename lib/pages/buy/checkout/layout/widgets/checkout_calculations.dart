import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/text/trimName.dart';
import 'package:provider/provider.dart';
import '../../checkout_provider.dart';

class CheckoutLayoutCalculations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CheckoutProvider provider = Provider.of(context);
    final List products = provider.args['products'];
    final String items = products.length == 1 ? 'item' : 'items';
    // print(products);
    return Column(
      children: [
        _mainHeading("Products", 'Price'),
        SizedBox(height: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: products
              .map<Widget>(
                (e) => _checkoutCalculations(
                  e['name'],
                  'NPR ${e['price']}.00',
                  products.indexOf(e),
                  products.length,
                ),
              )
              .toList(),
        ),
        SizedBox(height: 10),
        Container(height: 2, color: Colors.grey),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Delivery Charge',
              style: _bill(false),
            ),
            Text(
              'NPR ${provider.deliveryCharge}.00',
              style: _bill(false),
            )
          ],
        ),
        SizedBox(height: 10),
        Container(height: 2, color: AppColors.officialMatchThird),
        _mainHeading("Total (${products.length} $items)",
            'NPR ${provider.totalPrice.toString()}.00'),
        Align(
            alignment: Alignment.bottomRight,
            child: Text(
              'inclusive of VAT',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ))
      ],
    );
  }

  Container _checkoutCalculations(
      String left, String right, int index, int totalItems) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Container(
                  margin: EdgeInsets.only(right: 30),
                  child: Text(trimName(left, 25), style: _bill(false)),
                ),
              ),
              Text(right, style: _bill(false)),
            ],
          ),
        ],
      ),
    );
  }

  TextStyle _bill(bool mainHeading) => GoogleFonts.poppins(
        fontWeight: mainHeading ? FontWeight.w500 : FontWeight.w400,
        fontSize: mainHeading ? 16 : 15,
      );

  Container _mainHeading(String left, String right) {
    return Container(
      margin: EdgeInsets.only(top: 20),
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
