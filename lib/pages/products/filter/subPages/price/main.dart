import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/pages/products/filter/styles/appBar.dart';
import 'package:nepek_buyer/pages/products/filter/styles/apply_button_subpages.dart';
import 'package:nepek_buyer/pages/products/filter/subPages/price/price_provider.dart';
import 'package:nepek_buyer/styles/appBars/default_app_bar.dart';
import 'package:provider/provider.dart';
import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_provider.dart';

class FilterPricePage extends StatelessWidget {
  final args;

  const FilterPricePage({Key key, this.args}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PriceProvider(),
      child: FilterPricePageRoot(args: args),
    );
  }
}

class FilterPricePageRoot extends StatelessWidget {
  final args;
  FilterPricePageRoot({this.args});

  @override
  Widget build(BuildContext context) {
    final bool darktheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    final Color buttonColor =
        darktheme ? Colors.white : AppColors.officialMatch;
    final Color buttonTextColor = darktheme ? Colors.black : Colors.white;

    final PriceProvider provider = Provider.of(context);

    provider.init(args);

    return Scaffold(
      appBar: defaultAppBar(context, 'Price', darktheme),
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InputPrice(
                    label: 'Min',
                    autofocus: true,
                    changeFn: provider.priceChangedLocal,
                    initialValue: provider.price['min'],
                  ),
                  InputPrice(
                    label: 'Max',
                    autofocus: false,
                    changeFn: provider.priceChangedLocal,
                    initialValue: provider.price['max'],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: BottomAppBar(
        child: ApplyButtonSubPages(
          // width: double.infinity,
          onPressed: () {
            provider.changed(context);
          },
          child: Text(
            'Apply',
            style: GoogleFonts.poppins(
              color: buttonTextColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

class InputPrice extends StatelessWidget {
  final String initialValue;
  final String label;
  final bool autofocus;
  final Function changeFn;
  InputPrice({this.initialValue, this.label, this.autofocus, this.changeFn});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        SizedBox(width: 10),
        SizedBox(
          width: 110,
          // height: 30,
          child: TextFormField(
            style: GoogleFonts.poppins(),
            initialValue: initialValue,
            onChanged: (value) {
              changeFn(label, value);
            },
            decoration: InputDecoration(
              hintText: 'NPR',
              isDense: true,
              contentPadding: EdgeInsets.all(10),
            ),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            autofocus: autofocus,
          ),
        ),
      ],
    );
  }
}
