import 'package:flutter/material.dart';
import 'package:nepek_buyer/pages/products/viewProduct/widgets/qty_pop_up/main.dart';
import 'package:nepek_buyer/styles/button/nepek_button.dart';
import 'package:nepek_buyer/styles/popUps/errorPopUp.dart';
import 'package:provider/provider.dart';
// import 'package:nepek_buyer/styles/colors.dart';
// import 'package:nepek_buyer/styles/darkThemes/dark_theme_provider.dart';
import '../../../view_product_state.dart';

class AddToCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final product = Provider.of<ViewProductState>(context);
    // final bool darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    // final buttonColor = darkTheme ? Colors.white : AppColors.officialMatch;
    // final buttonTextColor = darkTheme ? Colors.black : Colors.white;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        NepekButton(
          width: width * 0.9,
          onClick: () {
            if (product.avVariants.length > 0 &&
                product.availableOpt.length > 0) {
              if (product.screen == 1)
                product.changeScreen(2);
              else
                product.done(context);
            } else
              qtyPop(context, product);
          },
          label: product.screen == 1 ? 'Add To Cart' : 'Done',
        ),
      ],
    );
  }
}
