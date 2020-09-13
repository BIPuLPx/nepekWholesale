import 'package:flutter/material.dart';
import 'package:skite_buyer/pages/viewProduct/styles/appBar.dart';
import 'package:skite_buyer/pages/viewProduct/widgets/productHeader/main.dart';
import 'package:skite_buyer/pages/viewProduct/widgets/swipe_images.dart';

class ViewProductLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        slivers: [
          viewProductAppBar(context),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SwipeImages(),
                ProductHeader(),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(),
      ),
    );
  }
}
