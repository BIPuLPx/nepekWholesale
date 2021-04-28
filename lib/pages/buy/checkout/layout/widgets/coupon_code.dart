import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/styles/button/nepek_button.dart';
import 'package:nepek_buyer/styles/text/nepek_text_input.dart';
import 'package:nepek_buyer/styles/text/normal_text.dart';
import 'package:provider/provider.dart';
import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_provider.dart';
import 'package:nepek_buyer/styles/text/textInput.dart';

class CouponCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bool darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 25),
        Heading(),
        SizedBox(height: 20),
        NepekTextInput(
          labelText: "NPK..",
          background: true,
          onChanged: (val) => print(val),
        ),
        SizedBox(height: 20),
        NepekButton(
          label: 'Apply',
          reverse: true,
          padding: 0,
          fontSize: 13,
          height: 38,
        )
      ],
    );
  }
}

class Heading extends StatelessWidget {
  const Heading({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NepekText(
          "nepek Gift Code",
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: AppColors.primaryBlue,
        ),
        SizedBox(width: 5),
        Icon(
          Icons.card_giftcard,
          color: AppColors.primaryBlue,
        )
      ],
    );
  }
}
