import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:skite_buyer/iconsClass/bottom_nav_icons_icons.dart';
import 'package:skite_buyer/iconsClass/result_page_icons_icons.dart';
import 'package:skite_buyer/listeners/cart_no_listener.dart';
import 'package:skite_buyer/pages/searchResult/sort/main.dart';
import 'package:skite_buyer/pages/searchResult/styles/appbar_nav_button.dart';
import 'package:skite_buyer/styles/colors.dart';

resultAppBar(
  resultContext,
  Function changeLayout,
  IconData currentIcon,
  String searchText,
  int itemLength,
  Function setSort,
  Map filterPageProps,
  Function setFilter,
) {
  return SliverAppBar(
    leading: IconButton(
      onPressed: () => Navigator.of(resultContext).pop(),
      icon: Icon(
        Icons.arrow_back_ios,
        color: AppColors().primaryBlue(),
        size: 17,
      ),
    ),
    floating: true,
    elevation: 50,
    brightness: Brightness.light,
    actions: [
      IconButton(
        icon: CartNoListener(
          size: 19,
          labelColor: Colors.white,
          iconColor: AppColors().primaryBlue(),
        ),
        onPressed: () => Navigator.pushNamed(resultContext, 'cart'),
      ),
      IconButton(
          icon: Icon(
            Icons.search,
            color: AppColors().primaryBlue(),
            size: 23,
          ),
          onPressed: () => Navigator.pushNamed(resultContext, 'search')),
    ],
    backgroundColor: Colors.white,
    expandedHeight: 128.0,
    bottom: PreferredSize(
      child: Container(
        padding: EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 10),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  '$itemLength items found for',
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
                Text(' $searchText',
                    style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w600))
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BottomNavBtn(
                  icon: ResultPageIcons.filter,
                  label: 'Filter',
                  iconSize: 15,
                  onClick: () => Navigator.pushNamed(
                    resultContext,
                    'filter_search_result',
                    arguments: {
                      'args': filterPageProps,
                      'filterFn': setFilter,
                    },
                  ),
                ),
                BottomNavBtn(
                  icon: ResultPageIcons.sort,
                  label: 'Sort',
                  iconSize: 12,
                  onClick: () {
                    searchResultSort(resultContext, setSort);
                  },
                ),
                IconButton(
                  icon: Icon(
                    currentIcon,
                    size: 15,
                    color: AppColors().primaryBlue(),
                  ),
                  onPressed: () => changeLayout(),
                )
              ],
            ),
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
