import 'package:flutter/material.dart';
import 'package:nepek_buyer/savedData/user_data.dart';
import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/text/normal_text.dart';
import 'package:provider/provider.dart';
import 'package:nepek_buyer/pages/home/tabs/profile/widgets/signed_in/widgets/routesContainer.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_provider.dart';

// Listings
//Active
//In Review
//Expired
//Declined

//Profile
//Questions

class SignedIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bool darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    final double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: darkTheme ? Colors.black : Colors.white,
        body: Container(
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.all(width * 0.1),
                child: Container(
                  padding: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        color: AppColors.officialMatch,
                        width: 2,
                      ),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      NepekText(
                        'Hello',
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: AppColors.officialMatch,
                      ),
                      NepekText(
                        UserPreferences().getDisplayName().split(' ')[0],
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                      ),
                      NepekText(
                        UserPreferences().getDisplayName().split(' ').last,
                        fontSize: 20,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
              LeftRightTile(
                tile1: RoutesContainer(
                  label: 'my account',
                  route: 'account',
                  icon: 'account',
                ),
                tile2: RoutesContainer(
                  label: 'my listings',
                  icon: 'questions',
                  route: 'my_listings',
                ),
              ),
              LeftRightTile(
                tile1: RoutesContainer(
                  label: 'Questions',
                  icon: 'orders',
                  route: 'questions',
                ),
                tile2: RoutesContainer(
                  label: 'help',
                  icon: 'reviews',
                  route: 'help',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LeftRightTile extends StatelessWidget {
  final Widget tile1;
  final Widget tile2;
  const LeftRightTile({Key key, this.tile1, this.tile2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(bottom: width * 0.1),
      padding: EdgeInsets.symmetric(horizontal: width * 0.1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          tile1,
          tile2,
        ],
      ),
    );
  }
}
