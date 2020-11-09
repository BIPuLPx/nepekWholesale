import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/pages/products/filter/styles/appBar.dart';
import 'package:nepek_buyer/pages/products/filter/styles/apply_spinkit.dart';
import 'package:provider/provider.dart';

import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_provider.dart';
import 'package:nepek_buyer/styles/extensions.dart';

import 'brand_provider.dart';

class FilterBrandsPage extends StatelessWidget {
  final args;
  const FilterBrandsPage({Key key, this.args}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BrandProvider(),
      child: FilterBrandsPageRoot(args: args),
    );
  }
}

class FilterBrandsPageRoot extends StatelessWidget {
  final args;
  FilterBrandsPageRoot({this.args});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BrandProvider>(context);

    if (provider.initInject == false) {
      provider.args = args;
      provider.currentBrands = [...args['queryFilter']];
      provider.allBrands = [...args['fetchedFilter']];
      provider.initInject = true;
    }

    final bool darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;

    final buttonColor = darkTheme ? Colors.white : AppColors().primaryBlue();
    final buttonTextColor = darkTheme ? Colors.black : Colors.white;
    // print(widget.args)
    return Scaffold(
      appBar: filterAppBar(context),
      body: SafeArea(
        child: ListView(
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          children: provider.allBrands
              .map<Widget>(
                (val) => buildCheckboxListTile(
                    val, buttonColor, buttonTextColor, provider),
              )
              .toList(),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 50,
          width: double.infinity,
          child: FlatButton(
            color: buttonColor,
            onPressed: () => provider.apply(context),
            child: provider.isApplying
                ? applySpinKit(buttonTextColor)
                : Text(
                    'Apply',
                    style: GoogleFonts.poppins(
                      color: buttonTextColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  CheckboxListTile buildCheckboxListTile(
      val, Color buttonColor, Color buttonTextColor, provider) {
    return CheckboxListTile(
      title: _checkBoxTexts(val, provider),
      value: provider.allBrands.length > 1
          ? provider.currentBrands.contains(val['name'])
          : true,
      onChanged: (bool value) {
        provider.clicked(val, value);
      },
      activeColor: buttonColor,
      checkColor: buttonTextColor,
    );
  }

  Row _checkBoxTexts(val, provider) {
    _labelStyle() => GoogleFonts.poppins(
        fontWeight: provider.currentBrands.contains(val['name'])
            ? FontWeight.w700
            : FontWeight.w400,
        fontSize: 14.2);
    return Row(
      children: [
        Text(capitalize(val['name']),
            // 'sds',
            style: _labelStyle()),
        SizedBox(width: 15),
        Text(capitalize('(${val['count'].toString()})'),
            // 'sds',
            style: _labelStyle()),
      ],
    );
  }
}
