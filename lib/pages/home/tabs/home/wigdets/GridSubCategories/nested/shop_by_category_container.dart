import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/spinkit.dart';

class CategoryCollectionsContainer extends StatelessWidget {
  final String link;
  final String label;
  final Color borderColor;
  const CategoryCollectionsContainer(
      {Key key, this.link, this.label, this.borderColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.3;
    return Container(
      padding: EdgeInsets.all(5),
      // height: 200,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 2,
          color: borderColor,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: CachedNetworkImage(
              imageUrl:
                  'https://images-na.ssl-images-amazon.com/images/I/61yqCiJhxtL._SY450_.jpg',
              placeholder: (context, url) =>
                  Container(height: 150, child: Center(child: spinkit)),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Text(
            label,
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
