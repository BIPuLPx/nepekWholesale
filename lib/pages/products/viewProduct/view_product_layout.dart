import 'package:flutter/material.dart';
import 'package:nepek_buyer/pages/products/viewProduct/styles/appBar.dart';
import 'package:nepek_buyer/pages/products/viewProduct/view_product_state.dart';
import 'package:nepek_buyer/pages/products/viewProduct/widgets/productOptions/main.dart';
import 'package:provider/provider.dart';
import 'widgets/bottomAppBar/main.dart';
import 'widgets/highlightsAndSpecs/main.dart';
import 'widgets/productHeader/main.dart';
import 'widgets/productImages/swipe_images.dart';
import 'widgets/productQnas/main.dart';
import 'widgets/productReviews/main.dart';

class ViewProductLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ViewProductState provider = Provider.of(context);
    return Scaffold(
      body: Container(
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            viewProductAppBar(context),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  provider.screen == 2
                      ? ProductOptions()
                      : Column(
                          children: [
                            SwipeImages(),
                            ProductHeader(),
                            HighLightsAndSpecs(),
                            ProductReviews(),
                            ProductQnas()
                          ],
                        )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: ViewProductBottomAppBar(),
    );
  }
}
