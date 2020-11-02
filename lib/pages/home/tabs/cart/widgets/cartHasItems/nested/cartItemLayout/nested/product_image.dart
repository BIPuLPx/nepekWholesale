import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  final String url;
  ProductImage({this.url});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 70,
      child: Image.network(
        url,
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
