import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skite_buyer/styles/colors.dart';
import 'package:skite_buyer/styles/darkThemes/dark_theme_provider.dart';
import 'package:skite_buyer/styles/text/textInput.dart';

class CouponCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bool darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 25),
        Text(
          'Coupon Code',
          style: _couponCode(),
        ),
        TextInput(
          labelText: 'SKTNP...',
        ),
        SizedBox(
          width: double.infinity,
          child: FlatButton(
            color: darkTheme ? Colors.white : AppColors().primaryBlue(),
            onPressed: () {},
            child: Text(
              'Apply',
              style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.w600,
                  color: darkTheme ? Colors.black : Colors.white),
            ),
          ),
        )
      ],
    );
  }

  TextStyle _couponCode() => GoogleFonts.quicksand(
        fontWeight: FontWeight.w700,
        fontSize: 19,
      );
}
