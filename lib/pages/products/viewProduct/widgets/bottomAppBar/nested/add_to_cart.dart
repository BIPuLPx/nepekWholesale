import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/pages/products/viewProduct/widgets/selectOptionsModal/main.dart';
import 'package:nepek_buyer/styles/popUps/errorPopUp.dart';
import 'package:provider/provider.dart';
import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_provider.dart';

import '../../../view_product_state.dart';
import 'qty.dart';

class AddToCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final product = Provider.of<ViewProductState>(context);
    final bool darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    final buttonColor = darkTheme ? Colors.white : AppColors().officialMatch();
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
              if(product.checkDuplicate()){
                errorPopup(context, 'This item is already added to cart\nPlease increase quantity in cart or place another order. ');
              }else{
                selectOptions(context, product.productName, product.productPrice,
                    product, darkTheme);
              }
            },
            child: Text(
              'Add To Cart',
              style: GoogleFonts.poppins(
                color: buttonTextColor,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
