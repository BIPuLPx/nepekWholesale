import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/pages/products/result/provider/main.dart';
import 'package:nepek_buyer/pages/products/result/sort/main.dart';
import 'package:nepek_buyer/styles/button/nepek_button.dart';
import 'package:provider/provider.dart';

// import 'package:nepek_buyer/iconsClass/bottom_nav_icons_icons.dart';
import 'package:nepek_buyer/listeners/cart_no_listener.dart';
import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_provider.dart';

class ResultAppBar extends StatelessWidget {
  final BuildContext resultContext;
  final Function changeLayout;
  final String currentIcon;
  final String searchText;
  final int itemLength;

  const ResultAppBar({
    Key key,
    this.resultContext,
    this.changeLayout,
    this.currentIcon,
    this.searchText,
    this.itemLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool darktheme =
        Provider.of<DarkThemeProvider>(resultContext).darkTheme;

    final result = Provider.of<ResultState>(context);
    final setSort = result.setSort;
    final getSort = result.getSort;

    final filterPageArgs = {
      'resultargs': result.args,
      'fetchedFilter': result.fetchedFilter,
      'refreshResultWithFilter': result.refreshPageWithFilter,
      'resetFilter': result.resetPage,
      'queryFilter': result.queryFilter,
      'searchText': result.args['query'],
      'totalProducts': result.productsNo,
      'lastFiltered': result.lastFiltered
    };
// final setSort = result.sey
    Color itemColor = darktheme ? Colors.white : AppColors.officialMatch;

    return SliverAppBar(
      leading: _leading(itemColor),
      floating: true,
      elevation: 50,
      actions: _actions(itemColor),
      expandedHeight: 140.0,
      bottom: PreferredSize(
        child: Container(
          padding: EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 10),
          // color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _queryText(searchText),
              _resultActions(itemColor, filterPageArgs, setSort, getSort),
            ],
          ),
        ),
        preferredSize: Size(
          double.infinity,
          kToolbarHeight,
        ),
      ),
    );
  }

  _queryText(String searchText) => Container(
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: Wrap(
          children: [
            Text(
              '$itemLength items found for ',
              style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
            ),
            Text(
              searchText,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
      );

  Container _resultActions(
    Color color,
    Object filterPageArgs,
    setSort,
    getSort,
  ) =>
      Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FLSortBTn(
              color: color,
              icon: 'filter',
              label: 'Filter',
              iconSize: 15,
              onClick: () => Navigator.pushNamed(
                resultContext,
                'filter_result',
                arguments: filterPageArgs,
              ),
            ),
            FLSortBTn(
              color: color,
              icon: 'sort',
              label: 'Sort',
              iconSize: 12,
              onClick: () {
                searchResultSort(resultContext, setSort, getSort);
              },
            ),
            IconButton(
              icon: Image.asset(
                currentIcon,
                height: 20,
                // size: 15,
                // color: color,
              ),
              onPressed: () => changeLayout(),
            )
          ],
        ),
      );

  IconButton _leading(Color color) => IconButton(
        onPressed: () => Navigator.of(resultContext).pop(),
        icon: Icon(
          Icons.arrow_back_ios,
          color: color,
          size: 21,
        ),
      );

  List<Widget> _actions(Color color) => [
        // IconButton(
        //   icon: CartNoListener(
        //     icon: Image.asset(
        //       'assets/bottomNavBar/cart.png',
        //       height: 20,
        //       color: color,
        //     ),
        //   ),
        //   onPressed: () => Navigator.pushNamed(resultContext, 'cart'),
        // ),
        IconButton(
          icon: Icon(
            Icons.search,
            color: color,
            size: 25,
          ),
          onPressed: () => Navigator.pushNamed(resultContext, 'search'),
        ),
      ];
}

class FLSortBTn extends StatelessWidget {
  final String icon;
  final String label;
  final Function onClick;
  final double iconSize;
  final Color color;

  FLSortBTn({this.icon, this.label, this.onClick, this.iconSize, this.color});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return NepekButton(
      width: deviceWidth * 0.33,
      height: 43,
      fontSize: 14,
      onClick: onClick,
      label: label,
      reverse: true,
      icon: Image.asset(
        'assets/product/$icon.png',
        height: 15,
      ),
    );
  }
}
