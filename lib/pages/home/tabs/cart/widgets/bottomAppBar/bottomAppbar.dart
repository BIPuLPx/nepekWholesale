import 'package:flutter/material.dart';
import 'package:nepek_buyer/styles/button/nepek_button.dart';
import 'package:nepek_buyer/styles/button/nepek_button_icon.dart';
import 'package:provider/provider.dart';
import 'package:nepek_buyer/pages/home/tabs/cart/cart_state.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_provider.dart';

class CartActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bool darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    final CartState provider = Provider.of(context);
    return BottomAppBar(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: NepekButton(
          onClick: () => provider.populateForCheckout(context),
          label: 'Order for NPR ${provider.totalPrice.toString()}.00',
          // icon: NepekButtonIcon(
          //   Icons.arrow_forward_ios,
          //   size: 18,
          // ),
          // iconReverse: true,
        ),
      ),
    );
  }
}
