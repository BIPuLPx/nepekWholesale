import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'product_container.dart';

class ProductsSlider extends StatefulWidget {
  final String heading;
  final List data;
  final Color backGroundColor;
  final Color headingColor;
  const ProductsSlider(
      {Key key,
      this.heading,
      this.backGroundColor,
      this.headingColor,
      this.data})
      : super(key: key);
  @override
  _ProductsSliderState createState() => _ProductsSliderState();
}

class _ProductsSliderState extends State<ProductsSlider>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.4;
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
              children: <Widget>[SizedBox(width: 5)] +
                  widget.data.map((e) => ProductContainer(product: e)).toList(),
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  Container _heading(String text, Color textColor) => Container(
        margin: EdgeInsets.only(bottom: 10, left: 10),
        child: Text(
          text,
          style: GoogleFonts.poppins(
            color: textColor == null ? Colors.black : textColor,
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
      );
}
