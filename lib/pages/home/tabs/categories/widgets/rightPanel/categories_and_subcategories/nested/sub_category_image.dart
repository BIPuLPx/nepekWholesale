import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SubCategoryImage extends StatelessWidget {
  final String url;
  SubCategoryImage({this.url});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 60,
      child: CachedNetworkImage(
        imageUrl: url,
        placeholder: (context, url) => Container(),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }
}
