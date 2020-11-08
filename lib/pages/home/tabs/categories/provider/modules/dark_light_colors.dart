import 'package:flutter/material.dart';
import 'package:nepek_buyer/styles/colors.dart';

class LightDarkColors {

  Map leftPanelColors(bool darktheme) {
    if (darktheme) {
      return LightDarkColors().darkSelectionColors;
    }
    return LightDarkColors().lightSelectionColors;
  }



  Map darkSelectionColors = {
    "selected": Colors.white,
    "unselected": Colors.black,
    'selectedText': AppColors().primaryBlue(),
    'unSelectedText': Colors.white
  };

  Map lightSelectionColors = {
    "selected": Colors.white,
    "unselected": Colors.grey[200],
    "text": Colors.yellow,
    'selectedText': AppColors().primaryBlue(),
    'unSelectedText': Colors.black
  };
}
