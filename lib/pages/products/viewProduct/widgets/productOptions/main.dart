import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/pages/products/viewProduct/view_product_state.dart';
import 'package:nepek_buyer/pages/products/viewProduct/widgets/bottomAppBar/nested/qty.dart';
import 'package:nepek_buyer/styles/network_image.dart';
import 'package:provider/provider.dart';

import 'nested/select_options.dart';

class ProductOptions extends StatelessWidget {
  Widget build(BuildContext context) {
    final ViewProductState provider = Provider.of(context);
    print(provider.optImg);
    return Container(
      color: Colors.white,
      width: double.infinity,
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(left: 15, right: 15, bottom: 20, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NepekImageNetwork(
            height: 150,
            width: 150,
            url:
                '${provider.imgUrl}/productImages/${provider.imgDir}/options/${provider.optImg}',
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: provider.availableOpt
                .map<Widget>((option) => SelectOptions(
                      title: option['name'],
                      options: option['value'],
                    ))
                .toList(),
          ),
          SizedBox(height: 20),
          Qty()
        ],
      ),
    );
  }
}
