import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skite_buyer/pages/home/tabs/profile/profile_provider.dart';
import 'package:skite_buyer/pages/home/tabs/profile/widgets/not_sigin_in/main.dart';
import 'package:skite_buyer/pages/home/tabs/profile/widgets/signed_in/main.dart';

import '../../../../savedData/user_data.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProfileState>(
      create: ((context) => ProfileState()),
      child: ProfileRoot(),
    );
  }
}

class ProfileRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<ProfileState>(context);
    if (profile.initCheck == false) {
      profile.checkLogged();
    }
    // UserPreferences().loggedIn(false);

    // if (UserPreferences().getLoggedIn() == true) {
    //   return SignedIn();
    // } else {
    //   return NotSignedIn();
    // }

    return SafeArea(
      child: Container(
        child: profile.currentScreen,
      ),
    );
  }
}
