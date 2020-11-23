import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepek_buyer/pages/my/myaccount/changeDefaultAdd/change_default_address.dart';
import 'package:nepek_buyer/pages/my/myaccount/content/account_heading.dart';
import 'package:nepek_buyer/pages/my/myaccount/content/content_value.dart';
import 'package:provider/provider.dart';
import 'package:nepek_buyer/styles/colors.dart';

import '../account_provider.dart';

class DefaultDeliveryAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AccountState provider = Provider.of(context);

    return Container(
      margin: EdgeInsets.only(bottom: 30, left: 30, right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AccountHeading(heading: "Default Address"),
              updateBtn(provider, context)
            ],
          ),
          AccountContentValue(value: provider.getDefaultAddress())
        ],
      ),
    );
  }
}

FlatButton updateBtn(AccountState provider, BuildContext context) => FlatButton(
      color: Colors.blue[50],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      onPressed: () => changeDefaultAddress(context),
      child: Text(
        'Update',
        style: updateBtnText(),
      ),
    );

TextStyle updateBtnText() => GoogleFonts.poppins(
      color: AppColors().officialMatch(),
      fontWeight: FontWeight.w600,
    );
