import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/styles/colors.dart';

final spinkit = SpinKitDoubleBounce(
  color: AppColors().primaryBlue(),
  size: 40.0,
);

Future<void> loadingPopUP(context, String title) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Loading',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        content: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              spinkit,
              SizedBox(height: 20),
              Text(
                title,
                style: GoogleFonts.poppins(color: appColors['secondaryText']),
              )
            ],
          ),
        ),
      );
    },
  );
}
