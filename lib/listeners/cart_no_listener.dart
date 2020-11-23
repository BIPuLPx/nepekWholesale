import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nepek_buyer/styles/colors.dart';

class CartNoListener extends StatelessWidget {
  final Widget icon;
  final Color labelColor;
  CartNoListener({this.labelColor, this.icon});
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box('cart').listenable(),
      builder: (context, box, widget) {
        return box.length == 0
            ? icon
            : Stack(
                // fit: StackFit.loose,
                overflow: Overflow.visible,
                children: [
                  icon,
                  Positioned(
                    right: -10,
                    top: -8,
                    child: Container(
                      height: 13,
                      width: 13,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: AppColors().officialMatch(),
                            spreadRadius: 0.025,
                            blurRadius: 0.11,
                          ),
                        ],
                        color: AppColors().officialMatch(),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          box.length.toString(),
                          style: GoogleFonts.poppins(
                            fontSize: 9,
                            fontWeight: FontWeight.w700,
                            color: labelColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
      },
    );
  }
}
