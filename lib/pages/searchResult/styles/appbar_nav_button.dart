import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skite_buyer/styles/colors.dart';

class BottomNavBtn extends StatelessWidget {
  final IconData icon;
  final String label;
  final Function onClick;
  final double iconSize;
  BottomNavBtn({this.icon, this.label, this.onClick, this.iconSize});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 135,
      height: 35,
      child: OutlineButton(
          highlightedBorderColor: AppColors().primaryBlue(),
          borderSide: BorderSide(color: AppColors().primaryBlue(), width: 1.6),
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0),
          ),
          onPressed: () => onClick(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 1),
              Icon(icon, size: iconSize, color: AppColors().primaryBlue()),
              SizedBox(width: 15),
              Text(
                label,
                style: GoogleFonts.aBeeZee(
                  fontWeight: FontWeight.w600,
                  color: AppColors().primaryBlue(),
                ),
              ),
              SizedBox(width: 15),
            ],
          )),
    );
  }
}
