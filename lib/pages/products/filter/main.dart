import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/pages/products/filter/provider/filter_provider.dart';
import 'package:nepek_buyer/pages/products/filter/styles/appBar.dart';
import 'package:nepek_buyer/pages/products/filter/styles/apply_spinkit.dart';
import 'package:nepek_buyer/pages/products/filter/styles/filter_entities_container.dart';
import 'package:provider/provider.dart';

import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_provider.dart';

class FilterPage extends StatelessWidget {
  final args;
  FilterPage({this.args});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FilterProvider>(
        create: (context) => FilterProvider(),
        child: FilterPageRoot(args: args));
  }
}

class FilterPageRoot extends StatelessWidget {
  final args;
  FilterPageRoot({this.args});
  @override
  Widget build(BuildContext context) {
    final filter = Provider.of<FilterProvider>(context);

    if (filter.initialState == false) {
      print(args);
      filter.args = args;
      filter.fetchedFilter = {...args['fetchedFilter']};
      filter.queryFilter = {...args['queryFilter']};
      filter.initialState = true;
      filter.totalProducts = args['totalProducts'];
      filter.lastFiltered = args['lastFiltered'];
    }

    return MainFilterPage();
  }
}

class MainFilterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final filter = Provider.of<FilterProvider>(context);

    // print(filter.queryFilter);
    // print(filter.fetchedFilter);
    print(filter.totalProducts);
    return Scaffold(
        appBar: filterAppBar(context),
        body: Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              // SizedBox(height: 10),
              FilterItemContainer(
                text: 'Price',
                route: 'filter_price',
                args: {
                  'fetchedFilter': filter.fetchedFilter['price'],
                  'queryFilter': filter.queryFilter['price'],
                  // 'min': filter.filteredBy['price']['min'],
                  // 'max': filter.filteredBy['price']['max'],
                  'priceChanged': filter.priceChanged
                },

                //   bottom: [filter.minPrice, filter.maxPrice],
                //   isPrice: true,
              ),
              // //Brands
              FilterItemContainer(
                text: 'Brand',
                route: 'filter_brands',
                args: {
                  'fetchedFilter': filter.lastFiltered['name'] == 'brand'
                      ? filter.lastFiltered['value']
                      : filter.fetchedFilter['brands'],
                  'queryFilter': filter.queryFilter['brand'],
                  'changeBrand': filter.brandChanged

                  // 'brands': filter.brands,
                  // 'currentBrands': filter.filteredBy['brand'],
                  // 'setBrand': filter.setBrands
                },
                bottom: filter.queryFilter['brand'],
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: filter.fetchedFilter['specifications']
                    .map<Widget>(
                      (specification) => FilterItemContainer(
                        text: specification['name'],
                        route: 'filter_options',
                        args: {
                          'queryFilter': filter.queryFilter['specifications'],
                          // 'fetchedFilter': specification,
                          'fetchedFilter':
                              filter.checkLastSpecs(specification['name'])
                                  ? {
                                      'name': filter.lastFiltered['specName'],
                                      'values': filter.lastFiltered['value']
                                    }
                                  : specification,

                          'changeSpecs': filter.specsChanged

                          // 'name': options['name'],
                          // 'values': options['values'],
                          // 'currentValues':
                          // filter.pickrequiredOptions(options['name']),
                          // 'setOptions': filter.setOptions,
                        },
                        bottom:
                            filter.getSelectedSpecs(specification['values']),
                      ),
                    )
                    .toList(),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNav());
  }
}

class BottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FilterProvider>(context);
    final bool darktheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    final Color buttonColor =
        darktheme ? Colors.white : AppColors.officialMatch;
    final Color buttonTextColor = darktheme ? Colors.black : Colors.white;
    final deviceWidth = MediaQuery.of(context).size.width;

    return BottomAppBar(
      child: Container(
        // color: ,
        height: 60,
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 42,
              child: OutlineButton(
                // splashColor: AppColors().(),
                highlightColor: Colors.white,

                highlightedBorderColor: buttonColor,
                borderSide: BorderSide(color: buttonColor, width: 1.5),
                onPressed: () => provider.reset(context),
                child: provider.setResetApply
                    ? applySpinKit(buttonColor)
                    : _buttonText(buttonColor, 'Reset'),
              ),
            ),
            SizedBox(
              height: 45,
              width: deviceWidth * 0.6,
              child: FlatButton(
                  onPressed: () => provider.apply(context),
                  color: buttonColor,
                  child: provider.setLoadingApply
                      ? applySpinKit(buttonTextColor)
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buttonText(buttonTextColor,
                                '${provider.totalProducts.toString()} items'),
                            _buttonText(buttonTextColor, 'Apply'),
                          ],
                        )),
            )
          ],
        ),
      ),
    );
  }

  Text _buttonText(Color color, String label) => Text(
        label,
        style: GoogleFonts.poppins(
          color: color,
          fontWeight: FontWeight.w600,
        ),
      );
}
