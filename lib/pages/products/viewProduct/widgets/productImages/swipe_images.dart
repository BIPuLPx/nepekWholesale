import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';
import 'package:nepek_buyer/styles/colors.dart';

import '../../view_product_state.dart';

// @override
// void initState() {
//   super.initState();
// }

// @override
// Widget build(BuildContext context) {

class SwipeImages extends StatefulWidget {
  @override
  _SwipeImagesState createState() => new _SwipeImagesState();
}

class _SwipeImagesState extends State<SwipeImages>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final ViewProductState provider = Provider.of(context);
    // print(provider.productImgs);
    return Center(
      child: Container(
        padding: EdgeInsets.only(top: 1, bottom: 10),
        // color: Colors.white,
        height: 440,
        width: double.infinity,
        child: new Swiper(
          itemBuilder: (BuildContext context, int index) {
            // print(index);
            return ProductImage(imgName: provider.productImgs[index]);
          },
          itemCount: provider.productImgs.length,
          // viewportFraction: 0.8,
          scale: 0.7,
          pagination: new SwiperPagination(
            margin: EdgeInsets.only(top: 40),
            builder: DotSwiperPaginationBuilder(
              color: Colors.grey[350],
              activeColor: AppColors().officialMatch(),
              space: 10,
              size: 5,
              activeSize: 8,
            ),
          ),
          control: new SwiperControl(size: 0),
        ),
      ),
    );
  }
}

class ProductImage extends StatelessWidget {
  final String imgName;
  const ProductImage({Key key, this.imgName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ViewProductState provider = Provider.of(context);
    return Stack(
      children: <Widget>[
        Center(
          child: Container(
            height: 500,
            // width: 600,
          ),
        ),
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 10, bottom: 40),
            child: Image.network(
              'https://skiteimages.ams3.digitaloceanspaces.com/productImages/${provider.productUid}/other/$imgName',
              height: 600,
              // height: 800,
              // width: 600,
              // placeholder: kTransparentImage,
            ),
          ),
        ),
      ],
    );
  }
}
