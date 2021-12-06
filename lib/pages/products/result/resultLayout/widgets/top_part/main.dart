import 'package:flutter/material.dart';
import 'package:nepek_buyer/pages/home/tabs/home/top_part/widgets/single_category.dart';
import 'package:nepek_buyer/pages/products/result/provider/main.dart';
import 'package:provider/provider.dart';

class ClassificationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final ResultState provider = Provider.of(context);
    // print(provider.allClasses);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Center(
        child: Wrap(
            spacing: deviceWidth * 0.02,
            runSpacing: deviceWidth * 0.02,
            children: provider.classifiedList
                .map(
                  (classify) => Category(
                    assetLocation: 'assets/homepage/top_part/products.png',
                    label: classify['label'],
                    onPressed: () =>
                        Navigator.pushNamed(context, 'result', arguments: {
                      "from": provider.args['to'],
                      "to": provider.argsTo,
                      "query": {
                        "_id": classify['_id'],
                        "name": classify['label']
                      }
                    }),
                  ),
                )
                .toList()),
      ),
    );
  }
}
