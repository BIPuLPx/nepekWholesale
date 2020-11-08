import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:nepek_buyer/library/commonContainers/right_arrow_containers.dart';
import 'package:nepek_buyer/pages/home/tabs/profile/widgets/common/widgets/change_theme.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_provider.dart';
import 'package:nepek_buyer/styles/extensions.dart';

import '../../../profile_provider.dart';

class CommonContainer extends StatelessWidget {
  final String label;
  final String route;
  final String icon;

  const CommonContainer({
    Key key,
    this.label,
    this.route,
    this.icon,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DarkThemeProvider>(context);

    _setDarkTheme(bool val) {
      themeProvider.darkTheme = val;
    }

    // final profile = Provider.of<ProfileState>(context);

    return CommonMenu(
      label: label,
      icon: 'assets/profileTab/$icon.png',
      ontap: () {
        if (icon == 'theme') {
          changeTheme(context, themeProvider.darkTheme, _setDarkTheme);
        }
      },
    );
    // return Material(
    //   // color: Colors.white,
    //   child: InkWell(
    //     onTap: () {
    //       if (icon == 'theme') {
    //         changeTheme(context, themeProvider.darkTheme, _setDarkTheme);
    //       }
    //     },
    //     child: Container(
    //       height: 50,
    //       padding: EdgeInsets.all(15),
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         children: [
    //           Row(
    //             children: [
    //               SizedBox(
    //                 width: 80,
    //                 child: Image.asset(
    //                   'assets/profileTab/$icon.png',
    //                   height: icon == 'theme' ? 16 : 17,
    //                 ),
    //               ),
    //               Text(
    //                 capitalize(label),
    //                 style: commonContainerLabel(),
    //               ),
    //             ],
    //           ),
    //           Icon(
    //             Icons.arrow_forward_ios,
    //             size: 12,
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}

TextStyle commonContainerLabel() => GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    );
