import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:skite_buyer/styles/colors.dart';

class SwipeImages extends StatefulWidget {
  @override
  _SwipeImagesState createState() => new _SwipeImagesState();
}

class _SwipeImagesState extends State<SwipeImages> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.white,
        height: 445,
        width: double.infinity,
        child: new Swiper(
          itemBuilder: (BuildContext context, int index) {
            // print(index);
            return Container(
              padding: EdgeInsets.only(top: 5, bottom: 40),
              child: new Image.network(
                "http://via.placeholder.com/600x800",
                fit: BoxFit.fill,
              ),
            );
          },
          itemCount: 4,
          viewportFraction: 0.8,
          scale: 0.8,
          pagination: new SwiperPagination(
            margin: EdgeInsets.only(top: 20),
            builder: DotSwiperPaginationBuilder(
              color: Colors.grey[350],
              activeColor: AppColors().primaryBlue(),
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
