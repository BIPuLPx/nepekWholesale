import 'package:flutter/material.dart';
import 'package:skite_buyer/pages/viewProduct/styles/appBar.dart';
import 'package:skite_buyer/pages/viewProduct/widgets/highlightsAndSpecs/main.dart';
import 'package:skite_buyer/pages/viewProduct/widgets/productDescription/main.dart';
import 'package:skite_buyer/pages/viewProduct/widgets/productHeader/main.dart';
import 'package:skite_buyer/pages/viewProduct/widgets/productOptions/main.dart';
import 'package:skite_buyer/pages/viewProduct/widgets/swipe_images.dart';

class ViewProductLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
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
                  HighLightsAndSpecs()
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(),
      ),
    );
  }
}
