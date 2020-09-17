import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:skite_buyer/iconsClass/bottom_nav_icons_icons.dart';
import 'package:skite_buyer/styles/colors.dart';

class CartNoListener extends StatelessWidget {
  final double size;
  final Color iconColor;
  final Color labelColor;
  CartNoListener({this.size, this.iconColor, this.labelColor});
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box('cart').listenable(),
      builder: (context, box, widget) {
        return box.length == 0
            ? Icon(
                BottomNavIcons.cart,
                size: size,
                color: iconColor,
              )
            : Stack(
                // fit: StackFit.loose,
                overflow: Overflow.visible,
                children: [
                  Icon(
                    BottomNavIcons.cart,
                    size: size,
                    color: iconColor,
                  ),
                  Positioned(
                    right: -10,
                    top: -8,
                    child: Container(
                      height: 13,
                      width: 13,
                      decoration: BoxDecoration(
                        color: AppColors().primaryGreen(),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          box.length.toString(),
                          style: GoogleFonts.ptSans(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
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
