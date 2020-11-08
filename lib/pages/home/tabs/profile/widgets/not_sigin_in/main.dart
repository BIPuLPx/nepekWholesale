import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:nepek_buyer/library/commonContainers/right_arrow_containers.dart';
import 'package:nepek_buyer/pages/home/tabs/profile/profile_provider.dart';
import 'package:nepek_buyer/pages/home/tabs/profile/widgets/common/main.dart';
import 'package:nepek_buyer/pages/home/tabs/profile/widgets/not_sigin_in/not_signed_in_provider.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_provider.dart';

class NotSignedIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NotSignedInState>(
      create: ((context) => NotSignedInState()),
      child: NotSignedInRoot(),
    );
  }
}

class NotSignedInRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final signin = Provider.of<NotSignedInState>(context);
    final profile = Provider.of<ProfileState>(context);
    final bool darktheme = Provider.of<DarkThemeProvider>(context).darkTheme;

    if (signin.initState == false) {
      signin.thirdPartyRoute = profile.externalRoute;
      signin.checkLogged = profile.checkLogged;
    }

    return Container(
      color: darktheme ? Colors.black : Colors.white,
      child: ListView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        children: [
          SizedBox(height: 100),
          NotSignedInHeading(text: 'You are not Signed In', fontSize: 25),
          NotSignedInHeading(text: 'Please Continue,', fontSize: 20),
          SizedBox(height: 50),
          NotSignedInContainer(
            label: 'Continue with Facebook',
            icon: 'Facebook',
            onTap: () => signin.signInWithFacebook(context),
          ),
          NotSignedInContainer(
            label: 'Continue with Google',
            icon: 'Google',
            // onTap: profile.checkLogged,
          ),
          NotSignedInContainer(
            label: 'Continue with Email',
            icon: 'Email',
            onTap: () => signin.continueWithEmail(context),
          ),
          signin.thirdPartyRoute == null ? Common() : Container()
        ],
      ),
    );
  }
}

class NotSignedInContainer extends StatelessWidget {
  final String label;
  final String icon;
  final onTap;

  const NotSignedInContainer({
    Key key,
    this.label,
    this.icon,
    this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final bool darkMode = Provider.of<DarkThemeProvider>(context).darkTheme;
    return CommonMenu(
      label: label,
      icon: 'icons/$icon.png',
      ontap: onTap,
    );
  }
}

class NotSignedInHeading extends StatelessWidget {
  final String text;
  final double fontSize;

  const NotSignedInHeading({Key key, this.text, this.fontSize})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Text(
        text,
        style: GoogleFonts.poppins(
            fontSize: fontSize, fontWeight: FontWeight.w700, height: 1.5),
      ),
    );
  }
}
