import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skite_buyer/styles/colors.dart';

class NoProductsSearch extends StatelessWidget {
  final String query;
  NoProductsSearch({this.query});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'No products Found for ',
                style: GoogleFonts.sarala(),
              ),
              Text(
                query,
                style: GoogleFonts.viga(),
              )
            ],
          ),
          SizedBox(height: 20),
          FlatButton(
            color: AppColors().primaryBlue(),
            onPressed: () => Navigator.pushReplacementNamed(context, 'search'),
            child: Text(
              'Go Back',
              style: GoogleFonts.ptSans(
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
