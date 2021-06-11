import 'package:flutter/material.dart';
import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/text/normal_text.dart';

searchResultSort(context, Function setSort, Function getSort) {
  final sort1 = {'sort': 'clicks', 'by': '-1'};
  final sort2 = {'sort': 'price', 'by': '-1'};
  final sort3 = {'sort': 'price', 'by': '1'};

  showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 10),
            SortTile(
              sortType: sort1,
              getSort: getSort,
              setSort: setSort,
              label: 'Popularity',
            ),
            SortTile(
              sortType: sort2,
              getSort: getSort,
              setSort: setSort,
              label: 'Higher price up',
            ),
            SortTile(
              sortType: sort3,
              getSort: getSort,
              setSort: setSort,
              label: 'Lower price up',
            ),
            SizedBox(height: 60),
          ],
        );
      });
}

class SortTile extends StatelessWidget {
  final Function getSort;
  final Function setSort;
  final Map sortType;
  final String label;

  const SortTile(
      {Key key, this.getSort, this.setSort, this.sortType, this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: getSort(sortType)
          ? Icon(
              Icons.done_rounded,
              color: AppColors.officialMatch,
            )
          : SizedBox(),
      title: NepekText(
        label,
        fontSize: 16,
        fontWeight: getSort(sortType) ? FontWeight.w600 : FontWeight.normal,
        color: getSort(sortType) ? AppColors.officialMatch : Colors.black,
      ),
      onTap: () {
        setSort(sortType);
        Navigator.pop(context);
      },
    );
  }
}
