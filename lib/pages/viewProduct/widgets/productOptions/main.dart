import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skite_buyer/pages/viewProduct/widgets/productOptions/nested/select_options.dart';

class ProductOptions extends StatelessWidget {
  final product;
  const ProductOptions({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(left: 15, right: 15, bottom: 20, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Heading(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: product.productOptions
                  .map<Widget>((option) => SelectOptions(
                        title: option['name'],
                        options: option['value'],
                        defaultOption: option['default'],
                        changeOption: product.changeOption,
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class Heading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Text(
        'Select your prefered options',
        style: GoogleFonts.cabin(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          // color: AppColors().primaryText(),
        ),
      ),
    );
  }
}
