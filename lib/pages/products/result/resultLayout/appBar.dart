import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/pages/products/result/provider/main.dart';
import 'package:provider/provider.dart';
// import 'package:nepek_buyer/iconsClass/bottom_nav_icons_icons.dart';
import 'package:nepek_buyer/iconsClass/result_page_icons_icons.dart';
import 'package:nepek_buyer/listeners/cart_no_listener.dart';
import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_provider.dart';

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
      'resultargs': result.args,
      'fetchedFilter': result.fetchedFilter,
      'refreshResultWithFilter': result.refreshPageWithFilter,
      'resetFilter': result.resetPage,
      'queryFilter': result.queryFilter,
      'searchText': result.args['query'],
      'totalProducts': result.productsNo,
      'lastFiltered': result.lastFiltered
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
              _queryText(
                result.args['type'] == 'subcategory'
                    ? result.args['name']
                    : searchText,
              ),
              _resultActions(itemColor, filterPageArgs),
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

  Container _resultActions(Color color, Object filterPageArgs) => Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FLSortBTn(
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
            FLSortBTn(
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

class FLSortBTn extends StatelessWidget {
  final IconData icon;
  final String label;
  final Function onClick;
  final double iconSize;
  final Color color;
  FLSortBTn({this.icon, this.label, this.onClick, this.iconSize, this.color});
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: deviceWidth * 0.33,
      height: 35,
      child: OutlineButton(
          highlightedBorderColor: color,
          borderSide: BorderSide(color: color, width: 1.6),
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(0),
          ),
          onPressed: () => onClick(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 1),
              Icon(icon, size: iconSize, color: color),
              SizedBox(width: 15),
              Text(
                label,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w700,
                  color: color,
                ),
              ),
              SizedBox(width: 15),
            ],
          )),
    );
  }
}
