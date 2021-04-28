import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/styles/button/nepek_button.dart';
import 'package:nepek_buyer/styles/button/nepek_button_icon.dart';
import 'package:provider/provider.dart';
import 'package:nepek_buyer/provider_head.dart';
import 'package:nepek_buyer/savedData/user_data.dart';
import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_provider.dart';
import 'package:nepek_buyer/styles/toasts/error_toast.dart';

import '../../view_product_state.dart';
import 'nested/no_qnas.dart';
import 'nested/yes_qnas.dart';

class ProductQnas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ViewProductState>(context);
    final bool darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    final providerHead = Provider.of<HeadProvider>(context);
    final buttonColor = darkTheme ? Colors.white : AppColors.officialMatch;
    // print(product.productQnas);
    return Container(
      padding: EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 25),
      // margin: EdgeInsets.only(bottom: 50),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          product.productQnas.length > 0 ? YesQnAs() : NoQnAsYet(),
          SizedBox(height: 20),
          NepekButton(
            height: 40,
            fontSize: 13,
            reverse: true,
            onClick: () {
              if (UserPreferences().getLoggedIn() != true) {
                showErrorToast(context, "Please sign in");
                Navigator.pushNamed(context, 'profile',
                    arguments: {"page": "view_product"});
              } else {
                Navigator.pushNamed(context, 'ask_a_qsn', arguments: {
                  'productName': product.productName,
                  'productID': product.productID,
                  'sellerID': product.sellerID,
                  'refresh': product.refresh
                });
              }
            },
            label: 'Ask a question',
            icon: NepekButtonIcon(
              Icons.question_answer_outlined,
              reversed: true,
              size: 19,
            ),
          ),
        ],
      ),
    );
  }
}
