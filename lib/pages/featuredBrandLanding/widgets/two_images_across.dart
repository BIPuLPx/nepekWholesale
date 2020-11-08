import 'package:flutter/material.dart';
import 'package:nepek_buyer/pages/featuredBrandLanding/widgets/image_container.dart';

class TwoImagesAcross extends StatelessWidget {
  final String route;
  final String route1;
  final String imgUrl;
  final String imgUrl1;
  final routeParams;
  final routeParams1;

  const TwoImagesAcross(
      {Key key,
      this.route,
      this.route1,
      this.imgUrl,
      this.imgUrl1,
      this.routeParams,
      this.routeParams1})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.45;
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: width,
            child: ImageContainer(
              route: route,
              imgUrl: imgUrl,
              routeParams: routeParams,
            ),
          ),
          SizedBox(
            width: width,
            child: ImageContainer(
              route: route1,
              imgUrl: imgUrl1,
              routeParams: routeParams1,
            ),
          )
        ],
      ),
    );
  }
}
