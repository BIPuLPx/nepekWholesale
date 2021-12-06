import 'package:flutter/material.dart';
import 'package:nepek_buyer/pages/add_listing/state/add_listing_state.dart';
import 'package:nepek_buyer/pages/add_listing/styles/appBar.dart';
import 'package:nepek_buyer/pages/add_listing/styles/floating_action_button.dart';
import 'package:provider/provider.dart';
import 'add_image_layout.dart';
import 'add_image_state.dart';

class AddImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AddImageState(),
      child: AddImageRoot(),
    );
  }
}

class AddImageRoot extends StatelessWidget {
  Widget build(BuildContext context) {
    final product = Provider.of<ListingData>(context);
    final provider = Provider.of<AddImageState>(context);

    if (!provider.firstAdded) provider.addFirst();

    return Scaffold(
      appBar: cancelAppBar(context, 'Images'),
      body: AddImageLayout(),
      floatingActionButton: AddProductNextBtn(
        onPressed: () {
          if (provider.validateImages(context)) {
            product.miniThumb = provider.miniThumb;
            product.currentImages = provider.imagePaths;
            product.injectListingData();
            product.setNextScreen(context, 6);
          }
        },
      ),
    );
  }
}
