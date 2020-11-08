import 'package:flutter/material.dart';
import 'package:nepek_buyer/pages/featuredBrandLanding/widgets/image_container.dart';

class FullWidthAndLonger extends StatelessWidget {
  final String route;
  final String imgUrl;
  final routeParams;

  const FullWidthAndLonger({Key key, this.route, this.routeParams, this.imgUrl})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: ImageContainer(
          route: route, imgUrl: imgUrl, routeParams: routeParams),
    );
  }
}
