import 'package:flutter/material.dart';
import 'package:nepek_buyer/pages/add_listing/state/add_listing_state.dart';
import 'package:nepek_buyer/pages/add_listing/styles/appBar.dart';
import 'package:nepek_buyer/pages/add_listing/styles/floating_action_button.dart';
import 'package:provider/provider.dart';

import 'classify_provider.dart';

// import 'package:nepek_buyer/pages/addProduct/state/add_product_state.dart';

class Classify extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ClassifyProvider(),
      child: ClassifyRoot(),
    );
  }
}

class ClassifyRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ClassifyProvider>(context);
    final rootProvider = Provider.of<ListingData>(context);
    if (!provider.init) {
      provider.initInject();
      provider.init = true;
    }
    return Scaffold(
      appBar: cancelAppBar(context, 'Add Listing'),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: provider.body,
      ),
      floatingActionButton: AddProductNextBtn(
        onPressed: () {
          rootProvider.currentClassification = provider.currentdata;
          rootProvider.setNextScreen(context, 2);
        },
      ),
    );
  }
}
