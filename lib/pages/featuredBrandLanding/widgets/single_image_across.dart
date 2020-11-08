import 'package:flutter/material.dart';
import 'package:nepek_buyer/pages/featuredBrandLanding/widgets/image_container.dart';

class SingleImageAcross extends StatelessWidget {
  final String route;
  final String imgUrl;
  final routeParams;

  const SingleImageAcross({Key key, this.route, this.imgUrl, this.routeParams})
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
