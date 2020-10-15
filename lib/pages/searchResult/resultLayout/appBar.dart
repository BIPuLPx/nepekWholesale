import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
// import 'package:skite_buyer/iconsClass/bottom_nav_icons_icons.dart';
import 'package:skite_buyer/iconsClass/result_page_icons_icons.dart';
import 'package:skite_buyer/listeners/cart_no_listener.dart';
import 'package:skite_buyer/pages/searchResult/result_provider.dart';
import 'package:skite_buyer/pages/searchResult/sort/main.dart';
import 'package:skite_buyer/pages/searchResult/styles/appbar_nav_button.dart';
import 'package:skite_buyer/styles/colors.dart';
import 'package:skite_buyer/styles/darkThemes/dark_theme_provider.dart';

class ResultAppBar extends StatelessWidget {
  final BuildContext resultContext;
  final Function changeLayout;
  final IconData currentIcon;
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

    final filterPageArgs = {
      'fetchedFilter': result.fetchedFilter,
      'refreshResultWithFilter': result.refreshPageWithFilter,
      'queryFilter': result.queryFilter,
      'searchText':result.searchText
    };

    Color itemColor = darktheme ? Colors.white : AppColors().primaryBlue();

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
              _queryText(),
              _resultActions(itemColor,filterPageArgs),
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

  _queryText() => Container(
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: Wrap(
          children: [
            Text(
              '$itemLength items found for',
              style: GoogleFonts.cabin(fontWeight: FontWeight.w400),
            ),
            Text(' $searchText',
                style: GoogleFonts.cabin(fontWeight: FontWeight.w600))
          ],
        ),
      );

  Container _resultActions(Color color,Object filterPageArgs) => Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BottomNavBtn(
              color: color,
              icon: ResultPageIcons.filter,
              label: 'Filter',
              iconSize: 15,
              onClick: () => Navigator.pushNamed(
                resultContext,
                'filter_result',
                arguments: filterPageArgs,
              ),
            ),
            BottomNavBtn(
              color: color,
              icon: ResultPageIcons.sort,
              label: 'Sort',
              iconSize: 12,
              onClick: () {
                // searchResultSort(resultContext, setSort);
              },
            ),
            IconButton(
              icon: Icon(
                currentIcon,
                size: 15,
                color: color,
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
          size: 17,
        ),
      );

  List<Widget> _actions(Color color) => [
        IconButton(
          icon: CartNoListener(
            icon: Image.asset(
              'assets/bottomNavBar/cartUnselected.png',
              height: 18,
              color: color,
            ),
            labelColor: Colors.white,
          ),
          onPressed: () => Navigator.pushNamed(resultContext, 'cart'),
        ),
        IconButton(
          icon: Icon(
            Icons.search,
            color: color,
            size: 23,
          ),
          onPressed: () => Navigator.pushNamed(resultContext, 'search'),
        ),
      ];
}
