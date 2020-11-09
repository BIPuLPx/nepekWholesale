import 'package:flutter/material.dart';
import 'package:nepek_buyer/pages/home/tabs/home/wigdets/featuredSlider/container.dart';
import 'package:nepek_buyer/styles/font_styles.dart';

class FeaturedSlider extends StatefulWidget {
  @override
  _FeaturedSliderState createState() => _FeaturedSliderState();
}

class _FeaturedSliderState extends State<FeaturedSlider>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeFonts().heading('Featured'),
        Container(
          // color: Colors.red,
          height: 200,
          child: ListView(
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            scrollDirection: Axis.horizontal,
            children: [
              BrandsContainer(text: 'Apple'),
              BrandsContainer(text: 'Samsung'),
              BrandsContainer(text: 'Huawei'),
              BrandsContainer(text: 'LG'),
              BrandsContainer(text: 'Dulla'),
              BrandsContainer(text: 'KTM CTY'),
              BrandsContainer(text: 'sdf'),
              BrandsContainer(text: 'sdf'),
              BrandsContainer(text: 'sdf'),
              BrandsContainer(text: 'sdf'),
              BrandsContainer(text: 'sdf'),
            ],
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
