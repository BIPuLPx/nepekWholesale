import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skite_buyer/pages/viewProduct/view_product_state.dart';

class ProductDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ViewProductState>(context);
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Description',
            style:
                GoogleFonts.openSans(fontSize: 15, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 5),
          Text(
            product.productDescription,
            style: GoogleFonts.roboto(height: 1.2),
          )
        ],
      ),
    );
  }
}
