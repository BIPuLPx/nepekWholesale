import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/savedData/apis.dart';
import 'package:nepek_buyer/styles/spinkit.dart';

class CategoryCollectionsContainer extends StatelessWidget {
  final Map data;
  const CategoryCollectionsContainer({
    Key key,
    this.data,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.42;
    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, 'result', arguments: {
          'type': 'subcategory',
          'query': data['_id'],
          'name': data['label']
        }),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // color: Colors.red,
              padding: EdgeInsets.all(10),
              child: CachedNetworkImage(
                imageUrl:
                    '$imgUrl/homeScreen/subCategoryCollection/${data['imgKey']}/${data['imageName']}',
                placeholder: (context, url) =>
                    Container(height: 150, child: Center(child: logoLoader())),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: Text(
                data['label'],
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
