import 'package:flutter/material.dart';
import 'package:nepek_buyer/pages/userData/continueEmail/main.dart';
import 'package:provider/provider.dart';
import 'package:nepek_buyer/pages/home/tabs/profile/profile_provider.dart';
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
      child: ContinueWithEmail(
        args: signin.continueWithEmailArgs(),
      ),
    );
  }
}
