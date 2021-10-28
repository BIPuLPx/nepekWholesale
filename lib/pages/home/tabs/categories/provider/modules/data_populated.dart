//
//
//
//
//
//
//
import 'package:flutter/material.dart';
import 'package:nepek_buyer/pages/home/tabs/categories/widgets/leftPanel/main.dart';
import 'package:nepek_buyer/pages/home/tabs/categories/widgets/rightPanel/main.dart';

class DataPopulated extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final totalWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Container(
        child: Row(
          children: [
            SizedBox(
              width: totalWidth * 0.25,
              child: LeftPanel(),
            ),
            SizedBox(
              width: totalWidth * 0.75,
              child: RightPanel(),
            )
          ],
        ),
      ),
    );
  }
}
