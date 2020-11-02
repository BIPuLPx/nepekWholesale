import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductContainer extends StatelessWidget {
  final String productName;
  const ProductContainer({Key key, this.productName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.40;
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 10, 10),
      padding: EdgeInsets.all(5),
      width: width,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.network(
              'https://skiteimages.ams3.digitaloceanspaces.com/productImages/6e6xuu4i4djakfyir0ssvksdu/miniThumb/image_cropper_1604149157349_compressed1833029275197122819.jpg',
            ),
          ),
          SizedBox(height: 5),
          Text(
            sliceLongName(productName),
            style: GoogleFonts.quicksand(
              fontWeight: FontWeight.w500,
              fontSize: 13
            ),
          ),
          // Text(

          // )
        ],
      ),
    );
  }
}

String sliceLongName(String name) {
  if (name.length > 35) {
    return name.substring(0, 32) + '.....';
  }
  return name;
}
