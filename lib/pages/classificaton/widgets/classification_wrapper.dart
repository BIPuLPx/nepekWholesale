import 'package:flutter/material.dart';
import 'package:nepek_buyer/pages/classificaton/provider.dart';
import 'package:nepek_buyer/pages/home/tabs/home/top_part/widgets/single_category.dart';
import 'package:provider/provider.dart';
import 'single_category.dart';

class ClassificationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final ClassificationProvider provider = Provider.of(context);
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
                    // onPressed: () => Navigator.pushNamed(
                    //   context,
                    //  provider.args['']  'classification',
                    //   arguments: {"for":provider.ar},
                    // ),
                  ),
                )
                .toList()),
      ),
    );
  }
}
