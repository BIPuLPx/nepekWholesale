import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:skite_buyer/styles/spinkit.dart';

class FrontCarasoul extends StatefulWidget {
  @override
  _FrontCarasoulState createState() => _FrontCarasoulState();
}

class _FrontCarasoulState extends State<FrontCarasoul>
    with AutomaticKeepAliveClientMixin {
  final List images = [
    "https://k.nooncdn.com/cms/pages/20200716/abf4444484c38bb83b7904fd0da79641/en_slider-01.gif",
    "https://k.nooncdn.com/cms/pages/20200716/ce62ea4055d312dad38b0c6fee2aed94/en_slider-01.gif",
    "https://k.nooncdn.com/cms/pages/20200716/0fcc704bdebf9f3f841a899468ed9e06/en_slider-01.gif"
  ];

  int currentIndex = 0;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      padding: EdgeInsets.only(top: 15, bottom: 15, left: 10, right: 10),
      child: CarouselSlider(
        options: CarouselOptions(
          viewportFraction: 1,
          autoPlay: true,
          height: 90,
          autoPlayInterval: Duration(seconds: 5),
          initialPage: currentIndex,
        ),
        items: images.map((img) {
          return Builder(
            builder: (BuildContext context) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'carasoul_landing',
                      arguments: {'img': img});
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: CachedNetworkImage(
                    imageUrl: img,
                    placeholder: (context, url) =>
                        Container(height: 150, child: Center(child: spinkit)),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
