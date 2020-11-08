import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_provider.dart';
import 'package:nepek_buyer/styles/extensions.dart';

class CommonMenu extends StatelessWidget {
  final String label;
  final String icon;
  final Function ontap;
  const CommonMenu({
    Key key,
    this.label,
    this.icon,
    this.ontap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final bool darktheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    return Material(
      color: darktheme ? Colors.black : Colors.white,
      child: InkWell(
        onTap: ontap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Image.asset(
                    icon,
                    height: label == 'Continue with Email' ? 13 : 18,
                  ),
                  SizedBox(width: 30),
                  Text(
                    capitalize(label),
                    style: commonContainerLabel(),
                  ),
                ],
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

TextStyle commonContainerLabel() => GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.w500,
    );
