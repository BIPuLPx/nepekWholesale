import 'package:flutter/material.dart';

class NepekImageNetwork extends StatelessWidget {
  final double height;
  final double width;
  final String url;
  const NepekImageNetwork({Key key, this.height, this.width, this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInImage.assetNetwork(
      height: height,
      width: width,
      // fadeOutCurve: Curves.easeOut,
      placeholder: 'images/image_placeholder-min.png',
      image: url,
      imageScale: 1.2,
    );
  }
}
