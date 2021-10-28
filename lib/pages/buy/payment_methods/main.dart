import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/functions/duplicate.dart';
import 'package:nepek_buyer/styles/button/nepek_button.dart';
import 'package:nepek_buyer/styles/text/format_price.dart';
import 'package:nepek_buyer/styles/text/normal_text.dart';
import 'package:provider/provider.dart';
import 'package:nepek_buyer/styles/appBars/default_app_bar.dart';
import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_provider.dart';
import 'provider.dart';

class PaymentMethodsRoot extends StatelessWidget {
  final args;
  const PaymentMethodsRoot({Key key, this.args}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PaymentMethodProvider provider = Provider.of(context);
    provider.products = duplicate(args['args']['products']);
    provider.refreshCart = args['args']['refreshCart'];
    // print(args);
    final bool darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    return Scaffold(
      backgroundColor: darkTheme ? Colors.black : Colors.white,
      appBar: defaultAppBar(context, 'Payment Methods', darkTheme),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            _onlyCod(),
            SizedBox(height: 30),
            _totalAmount(),
            margin(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Method',
                  style: _leftRightStyles(),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Icon(
                      Icons.payments_outlined,
                      color: AppColors.primaryBlue,
                    ),
                    SizedBox(width: 10),
                    NepekText(
                      'Cash on delivery',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryBlue,
                    ),
                  ],
                )
              ],
            )

            // CommonMenu(
            //   label: 'Cash on delivery',
            // ),
          ],
        ),
      ),
      bottomNavigationBar: _buyNow(provider, context, darkTheme),
    );
  }

  BottomAppBar _buyNow(
      PaymentMethodProvider provider, BuildContext context, bool darkTheme) {
    return BottomAppBar(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: NepekButton(
          icon: Image.asset(
            'assets/bottomNavBar/cart.png',
            color: darkTheme ? Colors.black : Colors.white,
            height: 17,
          ),
          onClick: () => provider.buyNow(context),
          label: 'Order Now',
        ),
      ),
    );
  }

  Row _totalAmount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Total Amount',
          style: _leftRightStyles(),
        ),
        Text(
          formatPrice(args['total']),
          style: _leftRightStyles(),
        ),
      ],
    );
  }

  TextStyle _leftRightStyles() => GoogleFonts.poppins(
        fontSize: 17,
        fontWeight: FontWeight.w600,
      );

  Widget _onlyCod() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sorry,',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'We have only cash on delivery method available at the moment , \nPlease have patience while we add other payment features soon',
          style: GoogleFonts.poppins(
            height: 1.5,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

Column margin() => Column(
      children: [
        SizedBox(height: 15),
        Container(
          color: Colors.grey,
          height: 2,
        ),
        SizedBox(height: 15),
      ],
    );

class PaymentMethods extends StatelessWidget {
  final args;
  const PaymentMethods({Key key, this.args}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PaymentMethodProvider(),
      child: PaymentMethodsRoot(args: args),
    );
  }
}
