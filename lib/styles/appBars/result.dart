import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skite_buyer/iconsClass/bottom_nav_icons_icons.dart';
import 'package:skite_buyer/iconsClass/result_page_icons_icons.dart';
import 'package:skite_buyer/styles/colors.dart';

resultAppBar(resultContext, Function changeLayout, IconData currentIcon,
    String searchText, int itemLength) {
  return SliverAppBar(
    leading: IconButton(
      onPressed: () => Navigator.of(resultContext).pop(),
      icon: Icon(
        Icons.arrow_back_ios,
        color: AppColors().primaryBlue(),
        size: 17,
      ),
    ),
    centerTitle: true,
    floating: true,
    elevation: 50,
    brightness: Brightness.light,
    title: Text(
      'Result',
      style: GoogleFonts.ptSans(
        color: AppColors().primaryBlue(),
        fontSize: 17,
        fontWeight: FontWeight.w600,
      ),
    ),
    actions: [
      IconButton(
        icon: Icon(
          BottomNavIcons.cart,
          color: AppColors().primaryBlue(),
          size: 19,
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
                  onClick: () =>
                      Navigator.pushNamed(resultContext, 'filter_result'),
                ),
                BottomNavBtn(
                  icon: ResultPageIcons.sort,
                  label: 'Sort',
                  iconSize: 12,
                  onClick: () {
                    print('sort');
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

class BottomNavBtn extends StatelessWidget {
  final IconData icon;
  final String label;
  final Function onClick;
  final double iconSize;
  BottomNavBtn({this.icon, this.label, this.onClick, this.iconSize});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 135,
      height: 35,
      child: OutlineButton(
          highlightedBorderColor: AppColors().primaryBlue(),
          borderSide: BorderSide(color: AppColors().primaryBlue(), width: 1.6),
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0),
          ),
          onPressed: () => onClick(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 1),
              Icon(icon, size: iconSize, color: AppColors().primaryBlue()),
              SizedBox(width: 15),
              Text(
                label,
                style: GoogleFonts.aBeeZee(
                  fontWeight: FontWeight.w600,
                  color: AppColors().primaryBlue(),
                ),
              ),
              SizedBox(width: 15),
            ],
          )),
    );
  }
}
