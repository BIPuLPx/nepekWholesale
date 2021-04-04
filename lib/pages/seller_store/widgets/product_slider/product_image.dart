import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            height: 150,
            // width: 120,
          ),
        ),
        Image.network(
          'https://placeimg.com/500/500/any',
        ),
      ],
    );
  }
}
