import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    final buttonColor = darkTheme ? Colors.white : AppColors().primaryBlue();
    // print(product.productQnas);
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
              height: 40,
              child: OutlineButton(
                highlightedBorderColor: buttonColor,
                borderSide: BorderSide(color: buttonColor, width: 1.6),
                onPressed: () {
                  if (!UserPreferences().getLoggedIn()) {
                    providerHead.thirdPartyProfileRoute = 'view_product';
                    showErrorToast(context, "Please sign in");
                    Navigator.pushNamed(context, 'profile',
                        arguments: {"page": "view_product"});
                  } else {
                    Navigator.pushNamed(context, 'ask_a_qsn', arguments: {
                      'productName': product.productName,
                      'productID': product.productID,
                      'sellerID': product.sellerUid,
                      'refresh': product.refresh
                    });
                  }
                },
                child: Text(
                  'Ask a Question',
                  style: GoogleFonts.poppins(
                    color: buttonColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
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
