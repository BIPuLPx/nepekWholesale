import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nepek_buyer/styles/spinkit.dart';

class ImageContainer extends StatelessWidget {
  final String route;
  final String imgUrl;
  final routeParams;

  const ImageContainer({Key key, this.route, this.imgUrl, this.routeParams})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CachedNetworkImage(
        imageUrl: imgUrl,
        placeholder: (context, url) =>
            Container(height: 150, child: Center(child: logoLoader())),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }
}
