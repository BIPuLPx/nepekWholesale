import 'package:flutter/material.dart';

void filterBrand(filterContext) {
  showModalBottomSheet(
      context: filterContext,
      builder: (context) {
        return Container(
          color: Color(0xFF737373),
          // height: 180,
          child: Container(
            child: Center(child: Text('Filter Brand')),
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(10),
                topRight: const Radius.circular(10),
              ),
            ),
          ),
        );
      });
}
