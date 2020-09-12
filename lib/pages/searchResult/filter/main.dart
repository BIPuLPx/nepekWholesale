import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skite_buyer/pages/searchResult/filter/filter_state.dart';
import 'package:skite_buyer/pages/searchResult/filter/styles/appBar.dart';
import 'package:skite_buyer/pages/searchResult/filter/styles/filter_entities_container.dart';
import 'package:skite_buyer/styles/colors.dart';
import 'package:skite_buyer/styles/font_styles.dart';

class SearchFilterPage extends StatelessWidget {
  final args;
  SearchFilterPage({this.args});
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
    // print(args['args']['filteredOptions']);

    final filter = Provider.of<FilterSearchState>(context);

    if (filter.initialState == false) {
      filter.optionsToFilter = [...args['args']['filterOptions']['options']];
//

      //
      final filterBy = args['args']['filterBy'];
      filter.populateFilteredOptions(args['args']['filteredOptions']);
      filter.filteredBy['price']['\$gte'] = filterBy['price']['\$gte'];
      filter.filteredBy['price']['\$lt'] = filterBy['price']['\$lt'];
      filter.filteredBy['brand'] = [...filterBy['brand']];
      filter.filteredBy['options'] = filterBy['options'];
      filter.brands = args['args']['filterOptions']['brands'];
      filter.initialState = true;
      // print(filter.filteredBy);
    }

    return Scaffold(
      appBar: filterAppBar(context),
      body: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: ListView(
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          children: [
            SizedBox(height: 10),
            FilterItemContainer(
              text: 'Price',
              route: 'filter_price',
              args: {
                'min': filter.filteredBy['\$gte'],
                'max': filter.filteredBy['\$lt'],
                'changeFn': filter.setPrice
              },
              bottom: [filter.minPrice, filter.maxPrice],
              isPrice: true,
            ),
            //Brands
            FilterItemContainer(
              text: 'Brand',
              route: 'filter_brands',
              args: {
                'brands': filter.brands,
                'currentBrands': filter.filteredBy['brand'],
                'setBrand': filter.setBrands
              },
              bottom: filter.filteredBy['brand'],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: filter.optionsToFilter
                  .map<Widget>(
                    (options) => FilterItemContainer(
                      text: options['name'],
                      route: 'filter_options',
                      args: {
                        'args': {
                          'name': options['name'],
                          'values': options['values'],
                          'currentValues':
                              filter.pickrequiredOptions(options['name']),
                          'setOptions': filter.setOptions,
                        },
                      },
                      bottom: filter.pickrequiredOptions(options['name']),
                    ),
                  )
                  .toList(),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
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

                  highlightedBorderColor: AppColors().primaryBlue(),
                  borderSide:
                      BorderSide(color: AppColors().primaryBlue(), width: 1.5),
                  onPressed: () {},
                  child: Text(
                    'Reset',
                    style: AppFontStyle().button(AppColors().primaryBlue()),
                  ),
                ),
              ),
              SizedBox(
                height: 45,
                width: 170,
                child: FlatButton(
                  onPressed: () {},
                  color: AppColors().primaryBlue(),
                  child: Text(
                    'Apply',
                    style: AppFontStyle().button(Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
