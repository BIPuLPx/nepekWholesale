import 'package:flutter/material.dart';

class AppColors {
  primaryBlue() => Color(0xff256eff);
  officialMatch() => Color.fromRGBO(128, 36, 106, 1);
  // officialBackground()=>Color.fromRGBO(28, 14, 42, 1);
  officialBackground() => Color.fromRGBO(16, 18, 22, 1);
  primaryBlueShadow() => Color.fromRGBO(37, 104, 255, 0.5);
  officialMatchShadow() => Color.fromRGBO(128, 36, 106, 0.5);
  primaryBlueLight() => Color.fromRGBO(37, 104, 255, 0.1);
  officialMatchLight() => Color.fromRGBO(128, 36, 106, 0.2);
  primaryGreen() => Color.fromRGBO(11, 180, 32, 1);
  primaryYellow() => Color.fromRGBO(254, 238, 0, 1);
  inkWellSplash() => Color.fromRGBO(37, 110, 255, 0.58);
  bottomNavbarUnselected() => Colors.grey[600];
  transparentAppbar() => Color.fromRGBO(255, 255, 255, 0.9);
  searchBarItems() => Colors.grey[600];
  primaryGray() => Colors.grey[600];
  ratingColor() => Colors.yellow[800];
  primaryText() => Colors.black87;
  secondaryText() => Colors.black54;
}

class TextInputColors {
  darkThemeBackground() => Colors.grey[900];
  darkThemeText() => Colors.grey[900];
  darkThemeHintText() => Colors.grey;
  lightThemeHintText() => Colors.grey[500];
}

class HomeColors {
  primaryBlueShade() => Color.fromRGBO(37, 100, 255, 0.2);
}

Map appColors = {
  'officialColor': Color(0xfffeee00),
};