import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skite_buyer/pages/viewProduct/view_product_state.dart';
import 'package:skite_buyer/styles/colors.dart';

class ProductHighlights extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ViewProductState>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: product.productHighlights
          .map((highlight) => HighlightsText(text: highlight))
          .toList(),
    );
  }
}

class HighlightsText extends StatelessWidget {
  final String text;
  HighlightsText({this.text});
  @override
  Widget build(BuildContext context) {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 2),
          height: 8,
          width: 8,
          decoration: BoxDecoration(
              color: AppColors().secondaryText(),
              borderRadius: BorderRadius.circular(5)),
        ),
        SizedBox(width: 7),
        Text(
          text,
          style: GoogleFonts.roboto(height: 1.5),
        ),
      ],
    );
  }
}
