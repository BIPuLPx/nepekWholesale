import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nepek_buyer/pages/home/tabs/profile/profile_provider.dart';

class Profile extends StatelessWidget {
  final args;

  const Profile({Key key, this.args}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProfileState>(
      create: ((context) => ProfileState()),
      child: ProfileRoot(args: args),
    );
  }
}

class ProfileRoot extends StatelessWidget {
  final args;

  const ProfileRoot({Key key, this.args}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<ProfileState>(context);
    if (profile.initCheck == false) {
      profile.checkLogged();
      if (args != null) {
        profile.externalRoute = args['page'];
      }
    }

    // final bool darktheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    // print(args);
    return Container(child: profile.currentScreen);
  }
}
