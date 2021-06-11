import 'package:flutter/material.dart';
import 'package:nepek_buyer/internet_checker/main.dart';
import 'package:nepek_buyer/styles/loaders/nepek_logo_loader.dart';
import 'package:provider/provider.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_provider.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bool darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;

    return MaterialApp(
        // theme: Styles.themeData(darkTheme, context),
        debugShowCheckedModeBanner: false,
        home: InternetChecker(
          child: Scaffold(
            backgroundColor: darkTheme ? Colors.black : Colors.white,
            body: Center(
              child: NepekLogoLoader(
                size: 200,
              ),
              // child: logoLoader(),
              // child: FlareCacheBuilder(
              //   [
              //     AssetFlare(
              //         bundle: rootBundle, name: 'animations/loadingScreen.flr')
              //   ],
              //   builder: (BuildContext context, bool isWarm) {
              //     return !isWarm
              //         ? Container(child: logoLoader())
              //         : SizedBox(
              //             height: 350,
              //             // width: 400,
              //             // child: FlareActor(
              //             //   "animations/loadingScreen.flr",
              //             //   // alignment: Alignment.topLeft,
              //             //   fit: BoxFit.fitHeight,
              //             //   animation: "Untitled",
              //             // ),
              //           );
              //   },
              // ),
            ),

            //  SizedBox(
            //   height: 420,
            //   width: 420,
            //   child: FlareActor(
            //     "animations/loadingScreen.flr",
            //     // alignment: Alignment.topLeft,
            //     fit: BoxFit.contain,
            //     animation: "Untitled",
            //   ),
            // ),
          ),
        ));
  }
}
