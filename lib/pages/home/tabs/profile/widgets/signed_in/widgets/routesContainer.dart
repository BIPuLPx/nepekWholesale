import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoutesContainer extends StatelessWidget {
  final String label;
  final String route;
  final IconData icon;
  final Color iconColor;

  const RoutesContainer(
      {Key key, this.label, this.route, this.icon, this.iconColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, route);
        },
        child: Container(
          padding: EdgeInsets.only(top: 15, bottom: 15),
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(1),
          //   color: Colors.white,
          //   boxShadow: [
          //     BoxShadow(
          //       color: AppColors().primaryBlue(),
          //       spreadRadius: 0.2,
          //       blurRadius: 2,
          //     ),
          //   ],
          // ),
          child: Row(
            children: [
              Icon(
                icon,
                color: iconColor,
                size: 20,
              ),
              SizedBox(width: 15),
              Text(
                label,
                style: routesContainerLabel(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

TextStyle routesContainerLabel() => GoogleFonts.openSans(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    );
