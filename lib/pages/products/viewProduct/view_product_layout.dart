import 'package:flutter/material.dart';
import 'package:nepek_buyer/pages/products/viewProduct/styles/appBar.dart';
import 'widgets/bottomAppBar/main.dart';
import 'widgets/highlightsAndSpecs/main.dart';
import 'widgets/productDescription/main.dart';
import 'widgets/productHeader/main.dart';
import 'widgets/productImages/swipe_images.dart';
import 'widgets/productQnas/main.dart';
import 'widgets/productReviews/main.dart';


class ViewProductLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: CustomScrollView(
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            slivers: [
              viewProductAppBar(context),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    SwipeImages(),
                    ProductHeader(),
                    ProductDescription(),
                    HighLightsAndSpecs(),
                    ProductReviews(),
                    ProductQnas()
                  ],
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: ViewProductBottomAppBar());
  }
}
