import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ResultLayout extends StatelessWidget {
  final List products;
  ResultLayout({this.products});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: products.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: GridTile(
            footer: Text(products[index]['productName']),
            child: Column(
              children: [
                CachedNetworkImage(
                  imageUrl: "http://via.placeholder.com/350x150",
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                Text(products[index]['price'].toString()),
              ],
            ), //just for testing, will fill with image later
          ),
        );
      },
    );
  }
}
