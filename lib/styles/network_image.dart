import 'package:flutter/material.dart';

class NepekImageNetwork extends StatelessWidget {
  final double height;
  final double width;
  final String url;
  final bool wide;
  const NepekImageNetwork(
      {Key key, this.height, this.width, this.url, this.wide})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInImage.assetNetwork(
      fadeInDuration: Duration(milliseconds: 1),
      fadeInCurve: Curves.linear,
      height: height,
      width: width,
      // fadeOutCurve: Curves.easeOut,
      placeholder: wide == true
          ? 'assets/others/image_placeholder-min-wide.png'
          : 'assets/others/image_placeholder-min.png',
      image: url,
      imageScale: 1.2,
      fit: wide == true ? BoxFit.cover : BoxFit.contain,
    );
  }
}
