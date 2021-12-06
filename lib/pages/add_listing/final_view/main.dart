import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/pages/add_listing/state/add_listing_state.dart';
import 'package:nepek_buyer/pages/add_listing/styles/appBar.dart';
import 'package:nepek_buyer/pages/add_listing/styles/floating_action_button.dart';
import 'package:nepek_buyer/styles/text/format_price.dart';
import 'package:nepek_buyer/styles/text/trimName.dart';
import 'package:provider/provider.dart';

class FinalView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ListingData provider = Provider.of(context);
    final product = provider.productData;

    // print(feeINDecimal);
    return Scaffold(
      appBar: cancelAppBar(context, 'Final View'),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            SizedBox(height: 15),
            _productImage(provider),
            SizedBox(height: 15),
            _leftRightData('Name', trimName(product['productName'], 30)),
            product['specifications'] != null ? _specs(product) : SizedBox(),
            SizedBox(height: 15),
            _leftRightData('Price', formatPrice(product['price'])),
            SizedBox(height: 150)
          ],
        ),
      ),
      floatingActionButton: AddProductFinishBtn(
        onPressed: () {
          provider.sendData(context);
        },
      ),
    );
  }

  Column _specs(product) {
    return Column(
      children: product['specifications']
          .map<Widget>((spec) => _leftRightData(spec['name'], spec['value']))
          .toList(),
    );
  }

  Align _productImage(ListingData provider) {
    return Align(
      alignment: Alignment.topRight,
      child: Image.file(
        File(provider.currentImages[0]['imgPath']),
        height: 200,
      ),
    );
  }

  Widget _leftRightData(String left, String right) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _productText(left, true),
          Flexible(
            child: Container(
              margin: EdgeInsets.only(left: 30),
              child: _productText(
                right,
                false,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Text _productText(String text, bool gray) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        // fontSize: 18,
        color: gray ? Colors.grey : null,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

_fee(fee) {
  // return fee.toString();
  return (fee / 100).toStringAsFixed(4);
}
