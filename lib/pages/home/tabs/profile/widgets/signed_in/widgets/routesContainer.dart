import 'package:flutter/material.dart';
import 'package:nepek_buyer/pages/home/tabs/profile/profile_provider.dart';
import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/extensions.dart';
import 'package:nepek_buyer/styles/text/normal_text.dart';
import 'package:provider/provider.dart';

class RoutesContainer extends StatelessWidget {
  final String label;
  final String route;
  final String icon;
  final Color iconColor;

  const RoutesContainer(
      {Key key, this.label, this.route, this.icon, this.iconColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final ProfileState profile = Provider.of(context);
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          // border: Border.all(
          //   color: AppColors().officialMatchFourth(),
          //   width: 1.5,
          // ),
          boxShadow: [
            BoxShadow(
              color: AppColors().officialMatchFourth(),
              blurRadius: 8,
              // spreadRadius: 1,
            )
          ]),
      width: width * 0.35,
      height: width * 0.35,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          onTap: () => Navigator.pushNamed(
            context,
            route,
            arguments: route == 'account'
                ? {'checkProfile': profile.checkLogged}
                : null,
          ),
          child: Container(
            padding: EdgeInsets.all(25),
            child: Stack(
              children: [
                Image.asset(
                  icon == null
                      ? 'assets/profileTab/$label.png'
                      : 'assets/profileTab/$icon.png',
                  height: 22,
                ),
                Positioned(
                  bottom: 0,
                  child: NepekText(
                    value: capitalize(label),
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: AppColors().officialMatch(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
