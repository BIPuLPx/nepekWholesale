import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:nepek_buyer/styles/colors.dart';

import '../account_provider.dart';
import 'account_heading.dart';

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

FlatButton updateBtn(String changeRoute, BuildContext context) {
  final AccountState provider = Provider.of(context);
  return FlatButton(
    color: Colors.blue[50],
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    onPressed: () {
      Navigator.pushNamed(
        context,
        changeRoute,
        arguments: {"pg": 'acc', 'refresh': provider.refreshAccount},
      );
    },
    child: Text(
      'Update',
      style: updateBtnText(),
    ),
  );
}

TextStyle updateBtnText() => GoogleFonts.poppins(
      color: AppColors().officialMatch(),
      fontWeight: FontWeight.w600,
    );
