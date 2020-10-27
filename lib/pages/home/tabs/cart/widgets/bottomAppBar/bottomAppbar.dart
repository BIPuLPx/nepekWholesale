import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skite_buyer/pages/home/tabs/cart/cart_state.dart';
import 'package:skite_buyer/styles/colors.dart';
import 'package:skite_buyer/styles/darkThemes/dark_theme_provider.dart';

class CartBottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bool darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    final CartState provider = Provider.of(context);
    return BottomAppBar(
      child: SizedBox(
        height: 50,
        child: FlatButton.icon(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(0)),
          ),
          color: darkTheme ? Colors.white : AppColors().primaryBlue(),
          onPressed: () {
            provider.populateForCheckout(context);
          },
          label: Text(
            'Proceed to Checkout for NPR ${provider.totalPrice.toString()}',
            style: GoogleFonts.nunitoSans(
              fontWeight: FontWeight.w600,
              color: darkTheme ? Colors.black : Colors.white,
            ),
          ),
          icon: Icon(
            Icons.arrow_forward,
            color: darkTheme ? Colors.black : Colors.white,
            size: 20,
          ),
        ),
      ),
    );
  }
}
