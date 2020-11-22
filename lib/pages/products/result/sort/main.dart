import 'package:flutter/material.dart';

searchResultSort(context, Function setSort) {
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
            ListTile(
              leading: Icon(Icons.control_point_duplicate),
              title: Text('Popularity'),
              onTap: () {
                setSort({'sort': 'clicks', 'by': 'desc'});
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.control_point_duplicate),
              title: Text('Higher price up'),
              onTap: () {
                setSort({'sort': 'price', 'by': 'desc'});
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.control_point_duplicate),
              title: Text('Lower price up'),
              onTap: () {
                setSort({'sort': 'price', 'by': 'asc'});
                Navigator.pop(context);
              },
            ),
          ],
        );
      });
}
