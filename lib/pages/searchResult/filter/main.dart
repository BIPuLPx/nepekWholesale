import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skite_buyer/pages/searchResult/filter/filter_state.dart';
import 'package:skite_buyer/pages/searchResult/filter/styles/appBar.dart';
import 'package:skite_buyer/pages/searchResult/filter/styles/filter_entities_container.dart';
import 'package:skite_buyer/styles/colors.dart';
import 'package:skite_buyer/styles/darkThemes/dark_theme_provider.dart';

class FilterPage extends StatelessWidget {
  final args;
  FilterPage({this.args});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FilterSearchState>(
        create: (context) => FilterSearchState(),
        child: FilterPageRoot(args: args));
  }
}

class FilterPageRoot extends StatelessWidget {
  final args;
  FilterPageRoot({this.args});
  @override
  Widget build(BuildContext context) {
    final filter = Provider.of<FilterSearchState>(context);

    if (filter.initialState == false) {
      filter.args = args;
      filter.fetchedFilter = {...args['fetchedFilter']};
      filter.queryFilter = {...args['queryFilter']};
      filter.initialState = true;
    }

    return MainFilterPage();
  }
}

class MainFilterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final filter = Provider.of<FilterSearchState>(context);

    // print(filter.queryFilter);
    // print(filter.fetchedFilter);
    print(filter.totalProducts);
    return Scaffold(
        appBar: filterAppBar(context),
        body: Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          child: ListView(
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
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
                children: filter.fetchedFilter['options']
                    .map<Widget>(
                      (options) => FilterItemContainer(
                        text: options['option'],
                        route: 'filter_options',
                        args: {
                          'queryFilter': filter.queryFilter['options'],
                          'fetchedFilter': options

                          // 'name': options['name'],
                          // 'values': options['values'],
                          // 'currentValues':
                          // filter.pickrequiredOptions(options['name']),
                          // 'setOptions': filter.setOptions,
                        },
                        // bottom: filter.pickrequiredOptions(options['name']),
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
    final bool darktheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    final Color buttonColor =
        darktheme ? Colors.white : AppColors().primaryBlue();
    final Color buttonTextColor = darktheme ? Colors.black : Colors.white;
    final deviceWidth = MediaQuery.of(context).size.width;

    return BottomAppBar(
      child: Container(
        color: buttonTextColor,
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
                onPressed: () {},
                child: _buttonText(buttonColor, 'Reset'),
              ),
            ),
            SizedBox(
              height: 45,
              width: deviceWidth * 0.6,
              child: FlatButton(
                  onPressed: () {},
                  color: buttonColor,
                  child: _buttonText(buttonTextColor, 'Apply')),
            )
          ],
        ),
      ),
    );
  }

  Text _buttonText(Color color, String label) => Text(
        label,
        style: GoogleFonts.cabin(
          color: color,
          fontWeight: FontWeight.w600,
        ),
      );
}
