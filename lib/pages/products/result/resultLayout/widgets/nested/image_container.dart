import 'package:flutter/material.dart';

class ResultProductImage extends StatelessWidget {
  final String dir;
  final String imgName;
  const ResultProductImage({Key key, this.dir, this.imgName}) : super(key: key);

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
          child: Image.network(
            'https://skiteimages.ams3.digitaloceanspaces.com/productImages/$dir/thumb/$imgName',
          ),
        ),
      ],
    );
  }
}
