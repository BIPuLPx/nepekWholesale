import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/container_with_shadow.dart';
import 'package:random_color/random_color.dart';

class CategoryAndProducts extends StatelessWidget {
  final String heading;
  final ColorHue colorHue;
  const CategoryAndProducts({Key key, this.heading, this.colorHue})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    RandomColor _randomColor = RandomColor();
    Color _color = _randomColor.randomColor(colorHue: colorHue);
    return Container(
      padding: EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _heading(heading, _color),
          Center(
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: <Widget>[
                GridContainer(_color),
                GridContainer(_color),
                GridContainer(_color),
                GridContainer(_color),
                GridContainer(_color),
                GridContainer(_color),
                GridContainer(_color),
                GridContainer(_color),
                GridContainer(_color),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _heading(String text, Color _color) => Center(
        child: Container(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 3),
            margin: EdgeInsets.only(bottom: 15, left: 10, top: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: _color,
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: _color,
                  offset: Offset(3, 3),
                )
              ],
            ),
            child: Text(
              text,
              style: GoogleFonts.poppins(
                backgroundColor: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
          ),
        ),
      );
}

class GridContainer extends StatelessWidget {
  final Color color;
  const GridContainer(this.color);

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return Stack(
      // overflow: Overflow.visible,
      children: [
        Container(
          padding: EdgeInsets.all(3),
          width: deviceWidth * 0.3,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: color,
                // spreadRadius: 1,
                offset: Offset(3, 3),
              )
            ],
            border: Border.all(
              width: 2,
              color: color,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GridContainerImage(),
              _name('as asdjhu sdjkbjk dsfbjkbdsf kjb ksdf j jsfb'),
              SizedBox(height: 15),
              _price('500'),
              SizedBox(height: 10),
              // _of('10')
            ],
          ),
        ),
        _perOff('10% off'),
      ],
    );
  }
}

class GridContainerImage extends StatelessWidget {
  const GridContainerImage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(height: 100),
        Image.network("https://placeimg.com/500/500/any"),
      ],
    );
  }
}

Text _name(name) {
  return Text(
    sliceLongName(name),
    style: GoogleFonts.poppins(
      // fontWeight: FontWeight.w400,
      fontSize: 12,
    ),
  );
}

Widget _price(price) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.baseline,
    children: [
      Text(
        'NPR  ',
        style: GoogleFonts.poppins(
          fontSize: 12,
          // fontWeight: FontWeight.w600,
        ),
      ),
      Text(
        '${price.toString()}.00',
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w600,
        ),
      ),
    ],
  );
}

Widget _perOff(String of) {
  return ShadowContainer(
    shadowColor: Colors.transparent,
    blurRadius: 0.5,
    spreadRadius: 0.05,
    offset: Offset(-1, 1),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      color: AppColors().officialMatch(),
      child: Text(
        of,
        style: GoogleFonts.poppins(
            color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600),
      ),
    ),
  );
}

String sliceLongName(String name) {
  if (name.length > 35) {
    return name.substring(0, 32) + '.....';
  }
  return name;
}
