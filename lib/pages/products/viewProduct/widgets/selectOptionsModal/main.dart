import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/pages/products/viewProduct/widgets/bottomModal/main.dart';
import 'package:nepek_buyer/pages/products/viewProduct/widgets/productOptions/main.dart';

import 'package:nepek_buyer/styles/colors.dart';

// import 'package:nepek_buyer/pages/viewProduct/widgets/productOptions/nested/select_options.dart';

// Navigator.of(context).push(new MaterialPageRoute<Null>(
//       builder: (BuildContext context) {
//         return Dialog();
//       },
//     fullscreenDialog: true
//   ));
selectOptions(context, productName, price, product, darkTheme) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10.0),
        topRight: Radius.circular(10.0),
      ),
    ),
    builder: (context) {
      final Color buttonColor =
          darkTheme ? Colors.white : AppColors().officialMatch();
      final Color buttonTextColor = darkTheme ? Colors.black : Colors.white;
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: buttonColor,
              size: 17,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          ProductOptions(),
          SizedBox(height: 35),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: FlatButton(
              color: buttonColor,
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(0),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                product.addTocart();
                addToCart(context, productName, price);
                // return onClick();
              },
              child: Text(
                'Done',
                style: GoogleFonts.poppins(
                  color: buttonTextColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}
