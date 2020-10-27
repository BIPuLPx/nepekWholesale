import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skite_buyer/styles/colors.dart';
import 'package:skite_buyer/styles/spinkit.dart';

class ShopByCategoryContainer extends StatelessWidget {
  final String link;
  final String label;
  const ShopByCategoryContainer({Key key, this.link, this.label})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.3;
    return Container(
      color: HomeColors().primaryBlueShade(),
      // height: 200,
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(5),
            child: CachedNetworkImage(
              imageUrl:
                  'https://images-na.ssl-images-amazon.com/images/I/61yqCiJhxtL._SY450_.jpg',
              placeholder: (context, url) =>
                  Container(height: 150, child: Center(child: spinkit)),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Container(
            margin: EdgeInsets.all(5),
            child: Text(
              label,
              style:
                  GoogleFonts.nunitoSans(fontSize: 13, fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }
}
