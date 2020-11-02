import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skite_buyer/pages/account/content/content_header.dart';
import 'package:skite_buyer/pages/account/content/content_value.dart';
import 'package:skite_buyer/styles/colors.dart';
import 'package:skite_buyer/styles/darkThemes/dark_theme_provider.dart';

class AccountContent extends StatelessWidget {
  final String heading;
  final List value;
  final bool hasValue;
  final String changeRoute;

  const AccountContent({
    Key key,
    this.heading,
    this.value,
    this.hasValue,
    this.changeRoute,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final bool darktheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    return Container(
      margin: EdgeInsets.only(bottom: 30, left: 30, right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AccountContentHeader(
            changeroute: changeRoute,
            heading: heading,
            hasUpdate: hasValue,
          ),
          hasValue == true
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: value
                      .map((val) => AccountContentValue(
                            value: val,
                          ))
                      .toList(),
                )
              : addVal(darktheme, changeRoute, 'Add $heading', context)
        ],
      ),
    );
  }
}

Widget addVal(
        bool darktheme, String routeName, String label, BuildContext context) =>
    Container(
      margin: EdgeInsets.only(top: 15),
      child: SizedBox(
        width: double.infinity,
        child: FlatButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, routeName);
          },
          color: darktheme ? Colors.white : AppColors().primaryBlue(),
          child: Text(
            label,
            style: GoogleFonts.quicksand(
              color: darktheme ? Colors.black : Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
