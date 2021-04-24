import 'package:flutter/material.dart';
import 'package:nepek_buyer/styles/network_image.dart';

class ResultProductImage extends StatelessWidget {
  final String url;
  final String dir;
  final String imgName;
  const ResultProductImage({Key key, this.dir, this.imgName, this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(
          child: Container(
            height: 150,
            // width: 120,
          ),
        ),
        Center(
          child: NepekImageNetwork(
            // height: 150,
            url: '$url/productImages/$dir/miniThumbnail/$imgName',
          ),
        ),
      ],
    );
  }
}
