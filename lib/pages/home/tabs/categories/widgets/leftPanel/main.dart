import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skite_buyer/pages/home/tabs/categories/categoriesprovider.dart';
import 'package:skite_buyer/pages/home/tabs/categories/widgets/leftPanel/nested/classes_text.dart';
import 'package:skite_buyer/styles/darkThemes/dark_theme_provider.dart';

class LeftPanel extends StatefulWidget {
  @override
  _LeftPanelState createState() => _LeftPanelState();
}

class _LeftPanelState extends State<LeftPanel> {
  int currentID = 0;
  void changeCurrentID(int id) {
    setState(() {
      currentID = id;
    });
  }

  @override
  Widget build(BuildContext context) {
    final classes = Provider.of<CategoriesState>(context).allClasses;
    return Container(
      child: ListView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        children: classes
            .map(
              (cls) => ClassesText(
                index: classes.indexOf(cls),
                cls: cls,
                currentID: currentID,
                changeID: changeCurrentID,
              ),
            )
            .toList(),
      ),
    );
  }
}
