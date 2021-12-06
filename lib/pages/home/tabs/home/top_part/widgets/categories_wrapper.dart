import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../home_provider.dart';
import 'single_category.dart';

class ClassificationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final HomeTabProvider provider = Provider.of(context);
    // print(provider.allClasses);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Center(
        child: Wrap(
            spacing: deviceWidth * 0.02,
            runSpacing: deviceWidth * 0.02,
            children: provider.allClasses
                .map(
                  (_class) => Category(
                    assetLocation: 'assets/homepage/top_part/products.png',
                    label: _class['label'],
                    onPressed: () => Navigator.pushNamed(
                      context,
                      'result',
                      arguments: {
                        "from": "class",
                        "to": "category",
                        "query": {"_id": _class['_id'], "name": _class['label']}
                      },
                    ),
                  ),
                )
                .toList()),
      ),
    );
  }
}
