import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/pages/products/viewProduct/styles/heading.dart';
import 'package:provider/provider.dart';

import '../../view_product_state.dart';


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
            heading('Description'),
            SizedBox(height: 15),
            Text(
              product.productDescription,
              style: GoogleFonts.poppins(height: 1.7),
            )
          ],
        ),
      ),
    );
  }
}
