import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skite_buyer/pages/viewProduct/view_product_state.dart';
import 'package:skite_buyer/pages/viewProduct/widgets/productQnas/nested/no_qnas.dart';
import 'package:skite_buyer/pages/viewProduct/widgets/productQnas/nested/yes_qnas.dart';
import 'package:skite_buyer/styles/colors.dart';
import 'package:skite_buyer/styles/darkThemes/dark_theme_provider.dart';

class ProductQnas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ViewProductState>(context);
    final bool darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    final buttonColor = darkTheme ? Colors.white : AppColors().primaryBlue();
    return Card(
      child: Container(
        padding: EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 25),
        // margin: EdgeInsets.only(bottom: 50),
        // color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            product.productQnas.length > 0 ? YesQnAs() : NoQnAsYet(),
            SizedBox(
              width: double.infinity,
              height: 30,
              child: OutlineButton(
                highlightedBorderColor: buttonColor,
                borderSide: BorderSide(color: buttonColor, width: 1.6),
                onPressed: () {},
                child: Text(
                  'Ask a Question',
                  style: GoogleFonts.roboto(
                    color: buttonColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
