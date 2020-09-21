import 'package:flutter/material.dart';
import 'package:skite_buyer/iconsClass/profile_tab_icons_icons.dart';
import 'package:skite_buyer/pages/home/tabs/profile/widgets/signed_in/widgets/hi.dart';
import 'package:skite_buyer/pages/home/tabs/profile/widgets/signed_in/widgets/routesContainer.dart';
import 'package:skite_buyer/savedData/user_data.dart';
import 'package:skite_buyer/styles/colors.dart';
// import 'package:provider/provider.dart';
// import 'package:skite_buyer/pages/home/tabs/profile/widgets/signed_in/signed_in_provider.dart';

// class SignedIn extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider<SignedInState>(
//       create: ((context) => SignedInState()),
//       child: SignedInRoot(),
//     );
//   }
// }

class SignedIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        padding: EdgeInsets.only(left: 30, right: 30),
        child: ListView(
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          children: [
            Hi(name: '${UserPreferences().getDisplayName().split(' ')[0]}'),
            RoutesContainer(
              label: 'Account',
              icon: ProfileTabIcons.account,
              iconColor: Colors.black87,
              route: 'account',
            ),
            RoutesContainer(
              label: 'Questions',
              icon: ProfileTabIcons.questions,
              iconColor: Colors.greenAccent[700],
            ),
            RoutesContainer(
              label: 'Orders',
              icon: ProfileTabIcons.orders,
              iconColor: AppColors().primaryBlue(),
            ),
            RoutesContainer(
              label: 'Reviews',
              icon: ProfileTabIcons.reviews,
              iconColor: Colors.amber[900],
            ),
            RoutesContainer(
              label: 'Returns',
              icon: ProfileTabIcons.returns,
              iconColor: Colors.red,
            ),
          ],
        ));
  }
}
