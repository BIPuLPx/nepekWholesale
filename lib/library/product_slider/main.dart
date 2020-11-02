import 'package:flutter/material.dart';
import 'package:skite_buyer/library/product_slider/product_container.dart';
import 'package:skite_buyer/styles/font_styles.dart';

class ProductsSlider extends StatefulWidget {
  @override
  _ProductsSliderState createState() => _ProductsSliderState();
}

class _ProductsSliderState extends State<ProductsSlider>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.40;
    super.build(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeFonts().heading('Featured'),
        Container(
          // color: Colors.red,
          height: height,
          child: ListView(
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            scrollDirection: Axis.horizontal,
            children: [
              SizedBox(width: 10),
              ProductContainer(
                productName: "Test for sale and nothing fbhjhbnsdf uisdhf hsdfjhhdfs hsdfhnkdfsjh hdfskuidfis kuhjdfskuhkfds khsfdjudhfs ksdfjuhkhfdks",
              ),
              ProductContainer(
                productName: "Test for sale and nothing",
              ),
              ProductContainer(
                productName: "Test for sale and nothing",
              ),
              ProductContainer(
                productName: "Test for sale and nothing",
              ),
              ProductContainer(
                productName: "Test for sale and nothing",
              ),
              ProductContainer(
                productName: "Test for sale and nothing",
              ),
              ProductContainer(
                productName: "Test for sale and nothing",
              ),
              ProductContainer(
                productName: "Test for sale and nothing",
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
