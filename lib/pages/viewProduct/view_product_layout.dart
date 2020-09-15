import 'package:flutter/material.dart';
import 'package:skite_buyer/pages/viewProduct/styles/appBar.dart';
import 'package:skite_buyer/pages/viewProduct/widgets/bottomAppBar/main.dart';
import 'package:skite_buyer/pages/viewProduct/widgets/highlightsAndSpecs/main.dart';
import 'package:skite_buyer/pages/viewProduct/widgets/productDescription/main.dart';
import 'package:skite_buyer/pages/viewProduct/widgets/productHeader/main.dart';
import 'package:skite_buyer/pages/viewProduct/widgets/productOptions/main.dart';
import 'package:skite_buyer/pages/viewProduct/widgets/productImages/swipe_images.dart';
import 'package:skite_buyer/pages/viewProduct/widgets/productQnas/main.dart';
import 'package:skite_buyer/pages/viewProduct/widgets/productReviews/main.dart';

class ViewProductLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Colors.grey[200],
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
                    ProductOptions(),
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
