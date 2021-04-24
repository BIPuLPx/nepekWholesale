import 'package:flutter/material.dart';

Map appColors = {
  'primaryButton': Color(0xff256eff),
  'secondaryText': Colors.grey[600],
  'officialColor': Color(0xfffeee00),
};

class AppColors {
  primaryBlue() => Color(0xff2568ff);
  officialMatch() => Color.fromRGBO(203, 20, 217, 1);
  officialMatchSecond() => Color.fromRGBO(203, 20, 217, 0.8);
  officialMatchThird() => Color.fromRGBO(203, 20, 217, 0.6);
  officialMatchFourth() => Color.fromRGBO(203, 20, 217, 0.3);
  // officialMatchFourth() => Color.fromRGBO(203, 20, 217, 0.1);
  officialMatchLight() => Color.fromRGBO(250, 232, 251, 1);
  officialMatchLightest() => Color.fromRGBO(203, 20, 217, 0.05);

  // officialBackground()=>Color.fromRGBO(28, 14, 42, 1);
  officialBackground() => Color.fromRGBO(16, 18, 22, 1);
  primaryBlueShadow() => Color.fromRGBO(37, 104, 255, 0.5);
  officialMatchShadow() => Color.fromRGBO(203, 20, 217, 0.5);
  primaryBlueLight() => Color.fromRGBO(37, 104, 255, 0.1);
  primaryGreen() => Color.fromRGBO(11, 124, 132, 1);
  primaryYellow() => Color.fromRGBO(254, 238, 0, 1);
  inkWellSplash() => Color.fromRGBO(37, 110, 255, 0.58);
  bottomNavbarUnselected() => Colors.grey[600];
  transparentAppbar() => Color.fromRGBO(255, 255, 255, 0.9);
  searchBarItems() => Colors.grey[600];
  primaryGray() => Colors.grey[600];
  ratingColor() => Colors.yellow[800];
  primaryText() => Colors.black87;
  secondaryText() => Colors.black54;
  gradientButtonShadow() => Color.fromRGBO(154, 43, 200, 0.6);
  reverseButton() => Colors.white;
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
