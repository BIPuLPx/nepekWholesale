import 'package:flutter/material.dart';
import 'package:nepek_buyer/styles/network_image.dart';

class ProductImage extends StatelessWidget {
  final String url;
  ProductImage({this.url});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: NepekImageNetwork(
        url: url,
        // placeholder: (context, url) => Center(
        //   child: Container(
        //     height: 17,
        //     child: spinkit,
        //   ),
        // ),
        // errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }
}
