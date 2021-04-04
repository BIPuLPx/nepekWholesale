import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/styles/font_styles.dart';
import 'package:random_color/random_color.dart';

import 'product_container.dart';

// RandomColor _randomColor = RandomColor();

class ProductsSlider extends StatefulWidget {
  final String heading;
  final List products;
  final Color backGroundColor;
  final Color headingColor;
  const ProductsSlider(
      {Key key,
      this.heading,
      this.products,
      this.backGroundColor,
      this.headingColor})
      : super(key: key);
  @override
  _ProductsSliderState createState() => _ProductsSliderState();
}

class _ProductsSliderState extends State<ProductsSlider>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.35;
    super.build(context);
    return Container(
      padding: EdgeInsets.only(bottom: 15),
      // margin: EdgeInsets.only(bottom: 15),
      color: widget.backGroundColor == null
          ? Colors.transparent
          : widget.backGroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _heading(widget.heading, widget.headingColor),
          Container(
            // color: Colors.red,
            height: height,
            child: ListView(
              // physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: [
                SizedBox(width: 5),
                ProductContainer(product: testProduct),
                ProductContainer(product: testProduct),
                ProductContainer(product: testProduct),
                ProductContainer(product: testProduct),
                ProductContainer(product: testProduct),
                ProductContainer(product: testProduct),
                ProductContainer(product: testProduct),
                ProductContainer(product: testProduct),
                ProductContainer(product: testProduct),
                ProductContainer(product: testProduct),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  Container _heading(String text, Color textColor) {
    Color _color = textColor;

    // Color _color = _randomColor.randomColor(
    //   Color: textColor,
    //   colorBrightness: ColorBrightness.dark,
    //   // colorSaturation: ColorSaturation.lowSaturation,
    // );

    return Container(
      margin: EdgeInsets.only(bottom: 10, left: 10, top: 10),
      // padding: EdgeInsets.all(3),
      // decoration: BoxDecoration(color: Colors.white, boxShadow: [
      //   BoxShadow(
      //     color: _color,
      //     spreadRadius: 3,
      //     blurRadius: 3,
      //   )
      // ]),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          color: _color,
          fontWeight: FontWeight.w700,
          fontSize: 16,
        ),
      ),
    );
  }
}

final testProduct = {
  'productName':
      "Test for sale and nothing fbhjhbnsdf uisdhf hsdfjhhdfs hsdfhnkdfsjh hdfskuidfis kuhjdfskuhkfds khsfdjudhfs ksdfjuhkhfdks",
  'price': 1000,
  'oldPrice': 1500
};
