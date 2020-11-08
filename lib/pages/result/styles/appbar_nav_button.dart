import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomNavBtn extends StatelessWidget {
  final IconData icon;
  final String label;
  final Function onClick;
  final double iconSize;
  final Color color;
  BottomNavBtn(
      {this.icon, this.label, this.onClick, this.iconSize, this.color});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 135,
      height: 35,
      child: OutlineButton(
          highlightedBorderColor: color,
          borderSide: BorderSide(color: color, width: 1.6),
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(0),
          ),
          onPressed: () => onClick(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 1),
              Icon(icon, size: iconSize, color: color),
              SizedBox(width: 15),
              Text(
                label,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  color: color,
                ),
              ),
              SizedBox(width: 15),
            ],
          )),
    );
  }
}
