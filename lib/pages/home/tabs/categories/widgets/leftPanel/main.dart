import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nepek_buyer/pages/home/tabs/categories/provider/main.dart';
import 'package:nepek_buyer/pages/home/tabs/categories/widgets/leftPanel/nested/classes_text.dart';

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
    // print(classes);
    return Container(
      child: ListView(
        physics: BouncingScrollPhysics(),
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
