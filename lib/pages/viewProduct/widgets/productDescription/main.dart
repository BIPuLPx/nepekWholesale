import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skite_buyer/pages/viewProduct/view_product_state.dart';

class ProductDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ViewProductState>(context);
    return Card(
      child: Container(
        margin: EdgeInsets.only(top: 10, bottom: 10),
        padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Description',
              style: GoogleFonts.cabin(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                // color: AppColors().primaryText(),
              ),
            ),
            SizedBox(height: 15),
            Text(
              product.productDescription,
              style: GoogleFonts.cabin(height: 1.7),
            )
          ],
        ),
      ),
    );
  }
}
