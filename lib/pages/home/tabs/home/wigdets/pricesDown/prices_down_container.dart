import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/styles/container_with_shadow.dart';

class PricesDownProduct extends StatelessWidget {
  const PricesDownProduct({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(5),
      width: deviceWidth * 0.3,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 2,
          color: Colors.red,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PricesDownProductImage(),
          _name('as asdjhu sdjkbjk dsfbjkbdsf kjb ksdf j jsfb'),
          SizedBox(height: 15),
          _price('500'),
          SizedBox(height: 10),
          _perOff('10% off')
          // _of('10')
        ],
      ),
    );
  }
}

class PricesDownProductImage extends StatelessWidget {
  const PricesDownProductImage({
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
    textBaseline: TextBaseline.alphabetic,
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
      color: Colors.red,
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
