import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_provider.dart';

class SignInButton extends StatelessWidget {
  final String label;
  final String imgPath;
  final Color labelColor;
  final double iconSize;
  final Function signinFn;
  const SignInButton(
      {Key key,
      this.label,
      this.imgPath,
      this.labelColor,
      this.iconSize,
      this.signinFn})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final darkMode = Provider.of<DarkThemeProvider>(context).darkTheme;
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: darkMode ? Colors.grey[900] : Colors.white,
        ),
        onPressed: () {
          signinFn(context);
          // signinFn();
        },
        child: Container(
          padding: EdgeInsets.only(
            // top: 15,
            // bottom: 15,
            left: 20,
            right: 20,
          ),
          width: double.infinity,
          height: 55,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                imgPath,
                height: iconSize,
                color: label == 'Continue with Email' ? labelColor : null,
              ),
              SizedBox(width: 60),
              Text(
                label,
                style: GoogleFonts.poppins(
                  color: labelColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
