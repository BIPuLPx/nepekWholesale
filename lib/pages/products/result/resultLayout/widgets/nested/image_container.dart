import 'package:flutter/material.dart';
import 'package:nepek_buyer/styles/network_image.dart';

class ResultProductImage extends StatelessWidget {
  final String url;
  final String dir;
  final String imgName;
  final sellerType;
  const ResultProductImage(
      {Key key, this.dir, this.imgName, this.url, this.sellerType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(sellerType);
    return Stack(
      children: <Widget>[
        Center(
          child: NepekImageNetwork(
            // height: 150,
            url: '$url/productImages/$dir/miniThumbnail/$imgName',
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.all(3),
            child: sellerType == 1
                ? Image.asset('assets/others/elite_sell.png', height: 12)
                : sellerType == 2
                    ? Image.asset('assets/others/nepek_sell.png', height: 12)
                    : Container(),
          ),
        ),
      ],
    );
  }
}
