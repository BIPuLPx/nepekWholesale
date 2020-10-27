import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skite_buyer/pages/home/tabs/profile/profile_provider.dart';
import 'package:skite_buyer/pages/home/tabs/profile/widgets/common/main.dart';
import 'package:skite_buyer/pages/home/tabs/profile/widgets/not_sigin_in/not_signed_in_provider.dart';
import 'package:skite_buyer/provider_head.dart';
import 'package:skite_buyer/styles/darkThemes/dark_theme_provider.dart';

import '../../../../../../styles/extensions.dart';

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

    if (signin.initState == false) {
      signin.thirdPartyRoute = profile.externalRoute;
      signin.checkLogged = profile.checkLogged;
    }

    return Container(
      // color: Colors.white,
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
            onTap: signin.signInWithFacebook,
          ),
          NotSignedInContainer(
            label: 'Continue with Google',
            icon: 'Google',
            // onTap: profile.checkLogged,
          ),
          NotSignedInContainer(
            label: 'Continue with Email',
            icon: 'Email',
            onTap: signin.continueWithEmail,
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
    // final profile = Provider.of<ProfileState>(context);
    return Material(
      // color: Colors.white,
      child: InkWell(
        onTap: () => onTap(context),
        child: Container(
          height: 50,
          padding: EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 80,
                    child: Image.asset(
                      'icons/$icon.png',
                      height: icon == 'Email' ? 13 : 17,
                      color:
                          icon == 'Email' && darkMode ? Colors.white54 : null,
                    ),
                  ),
                  Text(
                    capitalize(label),
                    style: _containerLabel(),
                  ),
                ],
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle _containerLabel() => GoogleFonts.nunitoSans(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      );
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
        style: GoogleFonts.nunitoSans(
            fontSize: fontSize, fontWeight: FontWeight.w800, height: 1.5),
      ),
    );
  }
}
