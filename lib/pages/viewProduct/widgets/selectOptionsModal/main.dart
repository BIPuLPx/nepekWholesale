import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skite_buyer/pages/viewProduct/view_product_state.dart';
import 'package:skite_buyer/pages/viewProduct/widgets/bottomModal/main.dart';
import 'package:skite_buyer/pages/viewProduct/widgets/productOptions/main.dart';
import 'package:skite_buyer/styles/colors.dart';

// import 'package:skite_buyer/pages/viewProduct/widgets/productOptions/nested/select_options.dart';

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
            darkTheme ? Colors.white : AppColors().primaryBlue();
        final Color buttonTextColor = darkTheme ? Colors.black : Colors.white;
        return
            // padding: EdgeInsets.only(top: 20),
            Column(
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
              ProductOptions(product: product),
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
                        style: GoogleFonts.nunitoSans(color: buttonTextColor),
                      ))),
            ]);
      });
}
