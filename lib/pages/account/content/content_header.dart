import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skite_buyer/pages/account/content/account_heading.dart';

class AccountContentHeader extends StatelessWidget {
  final String changeroute;
  final String heading;
  final bool hasUpdate;

  const AccountContentHeader(
      {Key key, this.heading, this.hasUpdate, this.changeroute})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AccountHeading(heading: heading),
        hasUpdate == true ? updateBtn(changeroute, context) : Container(),
      ],
    );
  }
}

FlatButton updateBtn(String changeRoute, BuildContext context) => FlatButton(
      color: Colors.pink[50],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      onPressed: () {
        Navigator.pushNamed(context, changeRoute);
      },
      child: Text(
        'Update',
        style: updateBtnText(),
      ),
    );

TextStyle updateBtnText() => GoogleFonts.rubik(
      color: Colors.pink,
      fontWeight: FontWeight.w500,
    );
