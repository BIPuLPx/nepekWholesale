import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/text/normal_text.dart';

Future<void> changeDefault(context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
          title: NepekText(
            value: 'Select Default Address',
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: AppColors().officialMatch(),
          ),
          actions: [],
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ChangeDefaultTile(),
              ChangeDefaultTile(),
              ChangeDefaultTile(),
            ],
          ));
    },
  );
}

class ChangeDefaultTile extends StatelessWidget {
  const ChangeDefaultTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors().officialMatchFourth(),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors().officialMatchFourth(),
            // spreadRadius: 0.5,
            blurRadius: 4,
            // offset: Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          splashColor: Colors.transparent,
          highlightColor: Colors.purple.withOpacity(0.2),
          child: Container(
            padding: EdgeInsets.all(10),
            child: NepekText(
              value: 'Changathali Bus Park',
              // color: AppColors().officialMatch(),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
