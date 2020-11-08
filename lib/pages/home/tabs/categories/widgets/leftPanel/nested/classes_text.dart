import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:nepek_buyer/pages/home/tabs/categories/provider/main.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_provider.dart';

class ClassesText extends StatelessWidget {
  final int index;
  final Map cls;
  final int currentID;
  final Function changeID;
  ClassesText({this.cls, this.currentID, this.changeID, this.index});
  @override
  Widget build(BuildContext context) {
    final classClicked = Provider.of<CategoriesState>(context).classClicked;
    final getColors = Provider.of<CategoriesState>(context).leftPanelColors;
    final darkMode = Provider.of<DarkThemeProvider>(context).darkTheme;


    return Container(
      height: 50,
      decoration: BoxDecoration(
          border: Border(
        top: BorderSide(
          color: darkMode ? Colors.grey : Colors.white,
          width: index == 0 ? 1.0 : 0,
        ),
        left: BorderSide(
          color: currentID == index
              ? getColors(darkMode)['selectedText']
              : getColors(darkMode)['unselected'],
          width: 4.0,
        ),
        right: BorderSide(
          color: darkMode ? Colors.grey : Colors.white,
          width: 1.0,
        ),
        bottom: BorderSide(
          color: darkMode ? Colors.grey : Colors.white,
          width: 1.0,
        ),
      )),
      child: Material(
        color: currentID == index
            ? getColors(darkMode)['selected']
            : getColors(darkMode)['unselected'],
        child: InkWell(
          onTap: () {
            changeID(index);
            classClicked(cls);
          },
          child: Center(
            child: Text(
              cls['label'],
              style: GoogleFonts.cabinCondensed(
                fontSize: 11,
                color: currentID == index
                    ? getColors(darkMode)['selectedText']
                    : getColors(darkMode)['unSelectedText'],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
