import 'package:flutter/material.dart';
import 'package:nepek_buyer/pages/products/give_review/provider.dart';
import 'package:provider/provider.dart';
import 'add_image_layout.dart';

class AddImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GiveReviewProvider provider = Provider.of(context);
    if (!provider.firstAdded) provider.addFirst();
    return AddImageLayout();
    // floatingActionButton: AddProductNextBtn(
    //   onPressed: () {
    //     if (provider.validateImages(context)) {
    //       product.miniThumb = provider.miniThumb;
    //       product.currentImages = provider.imagePaths;
    //       product.injectProductData();
    //       product.setNextScreen(context, 6);
    //     }
    //   },
    // ),
  }
}
