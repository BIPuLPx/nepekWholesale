import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:nepek_buyer/library/commonContainers/right_arrow_containers.dart';
import 'package:nepek_buyer/pages/home/tabs/profile/profile_provider.dart';

class RoutesContainer extends StatelessWidget {
  final String label;
  final String route;
  final IconData icon;
  final Color iconColor;

  const RoutesContainer(
      {Key key, this.label, this.route, this.icon, this.iconColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<ProfileState>(context);
    return CommonMenu(
      label: label,
      icon: 'assets/profileTab/$label.png',
      ontap: () {
        Navigator.pushNamed(
          context,
          route,
          arguments:
              route == 'account' ? {'checkProfile': profile.checkLogged} : null,
        );
      },
    );
    // return Material(
    //   // color: Colors.white,
    //   child: InkWell(
    //     onTap: () {
    //       // print(route);
    //       Navigator.pushNamed(context, route, arguments: route == 'account'
    //           ? {'checkProfile': profile.checkLogged}
    //           : null,
    //           );
    //     },
    //     child: Container(
    //       height: 50,
    //       padding: EdgeInsets.all(15),
    //       // decoration: BoxDecoration(
    //       //   borderRadius: BorderRadius.circular(1),
    //       //   color: Colors.white,
    //       //   boxShadow: [
    //       //     BoxShadow(
    //       //       color: AppColors().primaryBlue(),
    //       //       spreadRadius: 0.2,
    //       //       blurRadius: 2,
    //       //     ),
    //       //   ],
    //       // ),
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         children: [
    //           Row(
    //             children: [
    //               SizedBox(
    //                 width: 80,
    //                 child: Image.asset(
    //                   'assets/profileTab/$label.png',
    //                   height: 17,
    //                 ),
    //               ),
    //               Text(
    //                 capitalize(label),
    //                 style: routesContainerLabel(),
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

TextStyle routesContainerLabel() => GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    );
