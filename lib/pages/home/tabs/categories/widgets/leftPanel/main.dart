import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skite_buyer/pages/home/tabs/categories/categoriesprovider.dart';
import 'package:skite_buyer/styles/colors.dart';

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

class ClassesText extends StatelessWidget {
  final Map cls;
  final int currentID;
  final Function changeID;
  ClassesText({this.cls, this.currentID, this.changeID});
  @override
  Widget build(BuildContext context) {
    final classClicked = Provider.of<CategoriesState>(context).classClicked;
    return Container(
      height: 50,
      margin: EdgeInsets.only(top: 1),
      child: Material(
        color: currentID == cls['id'] ? Colors.white : Colors.grey[200],
        child: InkWell(
          // splashColor: Colors.black,
          // highlightColor: Colors.grey,
          onTap: () {
            changeID(cls['id']);
            classClicked(cls);
          },

          // padding: EdgeInsets.only(left: 10),
          child: Center(
            child: Text(
              cls['name'],
              style: GoogleFonts.robotoCondensed(
                fontSize: 11,
                color: currentID == cls['id']
                    ? AppColors().primaryBlue()
                    : AppColors().primaryText(),
              ),
            ),
            // ),
          ),
        ),
      ),
    );
  }
}
