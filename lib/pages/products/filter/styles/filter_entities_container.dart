import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/extensions.dart';

class FilterItemContainer extends StatelessWidget {
  final String text;
  final String route;
  final args;
  final List bottom;
  final bool isPrice;
  FilterItemContainer(
      {this.text, this.route, this.args, this.bottom, this.isPrice});
  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      margin: EdgeInsets.only(bottom: 10),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 2.0,
            color: Color(0xFFD6D6D6),
          ),
        ),
      ),
      // decoration: BoxDecoration(
      //   color: Colors.white,
      //   boxShadow: [
      //     BoxShadow(
      //       color: AppColors().officialMatch(),
      //       spreadRadius: 0.02,
      //       blurRadius: 0.5,
      //     ),
      //   ],
      //   borderRadius: BorderRadius.circular(1.0),
      // ),
      // Colors.grey
      child: Material(
        borderRadius: BorderRadius.circular(1.0),
        // color: _size.white,
        child: InkWell(
          borderRadius: BorderRadius.circular(1.0),
          onTap: () {
            Navigator.pushNamed(context, route, arguments: args);
          },
          splashColor: AppColors().inkWellSplash(),
          highlightColor: Colors.white10,
          // splashFactory: InkSplash.splashFactory,
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  capitalize(text),
                  style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w600, fontSize: 16),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: isPrice == true
                      ? Wrap(
                          children: bottom.length < 2
                              ? []
                              : [
                                  bottom[0] == ''
                                      ? Container()
                                      : BottomText(child: bottom[0]),
                                  bottom[1] == ''
                                      ? Container()
                                      : BottomText(child: bottom[1])
                                ])
                      : Wrap(
                          children: bottom == null
                              ? []
                              : bottom
                                  .map(
                                    (e) =>
                                        bottom.indexOf(e) != bottom.length - 1
                                            ? BottomText(child: '$e, ')
                                            : BottomText(child: e),
                                  )
                                  .toList(),
                        ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BottomText extends StatelessWidget {
  final String child;
  BottomText({this.child});
  @override
  Widget build(BuildContext context) {
    return Text(capitalize(child), style: GoogleFonts.openSans(fontSize: 12));
  }
}
