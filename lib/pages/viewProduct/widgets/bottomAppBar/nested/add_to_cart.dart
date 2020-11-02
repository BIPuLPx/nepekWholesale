import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skite_buyer/pages/viewProduct/view_product_state.dart';
import 'package:skite_buyer/pages/viewProduct/widgets/bottomAppBar/nested/qty.dart';
import 'package:skite_buyer/pages/viewProduct/widgets/selectOptionsModal/main.dart';
import 'package:skite_buyer/styles/colors.dart';
import 'package:skite_buyer/styles/darkThemes/dark_theme_provider.dart';

class AddToCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final product = Provider.of<ViewProductState>(context);
    final bool darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    final buttonColor = darkTheme ? Colors.white : AppColors().primaryBlue();
    final buttonTextColor = darkTheme ? Colors.black : Colors.white;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Qty(),
        SizedBox(
          width: width * 0.55,
          height: 50,
          child: FlatButton(
            color: buttonColor,
            onPressed: () {
              selectOptions(context, product.productName, product.productPrice,
                  product, darkTheme);
            },
            child: Text(
              'Add To Cart',
              style: GoogleFonts.quicksand(
                color: buttonTextColor,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
