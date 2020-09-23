import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ResultProductImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CachedNetworkImage(
        imageUrl:
            // '$productApi/images/${widget.products[index]['uid']}/${widget.products[index]['miniThumb']}',
            'http://rachelwojo.com/wp-content/uploads/2015/05/nature-square.jpg',
        placeholder: (context, url) =>
            Container(height: 120, child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }
}
