import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:nepek_buyer/pages/home/tabs/profile/widgets/common/main.dart';
import 'package:nepek_buyer/pages/home/tabs/profile/widgets/signed_in/widgets/routesContainer.dart';
import 'package:nepek_buyer/savedData/user_data.dart';
import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_provider.dart';
// import 'package:provider/provider.dart';
// import 'package:nepek_buyer/pages/home/tabs/profile/widgets/signed_in/signed_in_provider.dart';

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
    final bool darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    return Scaffold(
      backgroundColor: darkTheme ? Colors.black : Colors.white,
      body: Container(
        // color: Colors.white,
        child: CustomScrollView(
          physics:
              BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              elevation: 10,
              title: Text(
                UserPreferences().getDisplayName(),
                // 'Bipul',
                style: GoogleFonts.poppins(
                  // color: AppColors().officialMatch(),
                  color: darkTheme ? Colors.white : AppColors().officialMatch(),
                  fontSize: 20,
                  fontWeight: FontWeight.w600, // fontStyle: FontStyle.italic
                  // fontWeight: FontWeight.5old,
                ),
              ),
              centerTitle: true,
              // shape: ContinuousRectangleBorder(
              //   borderRadius: BorderRadius.only(
              //     bottomLeft: Radius.circular(100),
              //     bottomRight: Radius.circular(100),
              //   ),
              // ),
              // expandedHeight: 200,
              pinned: true,
              // stretchTriggerOffset: 50,
              floating: true,
              // pinned: true,
              // backgroundColor: Colors.white,
              // toolbarHeight: 60,
              // flexibleSpace: FlexibleSpaceBar(
              //   collapseMode: CollapseMode.parallax,
              //   // centerTitle: true,
              //   title: Text(
              //     UserPreferences().getDisplayName(),
              //     // 'Bipul',
              //     style: GoogleFonts.poppins(
              //       // color: AppColors().officialMatch(),
              //       color: darkTheme ? Colors.white : AppColors().officialMatch(),
              //       fontSize: 20,
              //       fontWeight: FontWeight.w700, // fontStyle: FontStyle.italic
              //       // fontWeight: FontWeight.5old,
              //     ),
              //   ),
              // ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  SizedBox(height: 50),
                  RoutesContainer(
                    label: 'account',
                    route: 'account',
                  ),
                  RoutesContainer(
                    label: 'questions',
                    route: 'my_questions',
                  ),
                  RoutesContainer(
                    label: 'orders',
                    route:'my_orders'
                  ),
                  RoutesContainer(
                    label: 'reviews',
                  ),
                  RoutesContainer(
                    label: 'returns',
                  ),
                  Common(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

//  body: CustomScrollView(
//         physics: BouncingScrollPhysics(),
//         controller: _scrollController,
//         slivers: <Widget>[
//           resultAppBar(
//               context,
//               changeListType,
//               current,
//               result.searchText,
//               result.productsNo,
//               result.setSort,
//               filterPageProps,
//               result.setFilter),
//           SliverGrid(
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: listType == 'grid' ? 2 : 1,
//               childAspectRatio: (itemWidth / height),
//             ),
//             delegate: SliverChildBuilderDelegate(
//               (BuildContext context, int index) {
//                 if (listType == 'grid') {
//                   return GridLayout(index: index, result: result);
//                 } else {
//                   return ListLayout(index: index, result: result);
//                 }
//               },
//               childCount: result.products.length,
//             ),
//           ),
//           SliverList(
//             delegate: SliverChildListDelegate(
//               [result.loadingMore],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// class SignedIn extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         color: Colors.white,
//         child: ListView(
//           physics:
//               BouncingScrollPhysics(),
//           children: [
//             Hi(name: '${UserPreferences().getDisplayName().split(' ')[0]}'),
//             RoutesContainer(
//               label: 'Account',
//               icon: ProfileTabIcons.account,
//               iconColor: Colors.black87,
//               route: 'account',
//             ),
//             RoutesContainer(
//               label: 'Questions',
//               icon: ProfileTabIcons.questions,
//               iconColor: Colors.greenAccent[700],
//             ),
//             RoutesContainer(
//               label: 'Orders',
//               icon: ProfileTabIcons.orders,
//               iconColor: AppColors().officialMatch(),
//             ),
//             RoutesContainer(
//               label: 'Reviews',
//               icon: ProfileTabIcons.reviews,
//               iconColor: Colors.amber[900],
//             ),
//             RoutesContainer(
//               label: 'Returns',
//               icon: ProfileTabIcons.returns,
//               iconColor: Colors.red,
//             ),
//           ],
//         ));
//   }
// }
