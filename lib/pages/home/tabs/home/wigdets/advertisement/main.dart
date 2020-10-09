import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skite_buyer/styles/spinkit.dart';

class HomeAd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: ClipRRect(
        // borderRadius: BorderRadius.circular(10.0),
        child: CachedNetworkImage(
          imageUrl:
              'https://k.nooncdn.com/cms/pages/20200927/a2358cc424a65780198d14fe9bebbb03/en_slider-01.png',
          placeholder: (context, url) =>
              Container(height: 150, child: Center(child: spinkit)),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
    );
  }
}
