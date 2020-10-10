import 'package:flare_flutter/asset_provider.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_cache_builder.dart';
import 'package:flare_flutter/provider/asset_flare.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:skite_buyer/styles/darkThemes/dark_theme_provider.dart';
import 'package:skite_buyer/styles/darkThemes/dark_theme_styles.dart';
import 'package:skite_buyer/styles/spinkit.dart';
// import 'package:flare_flutter/asset_provider.dart';
// import 'package:flare_flutter/provider/asset_flare.dart'

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bool darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    return MaterialApp(
        // theme: Styles.themeData(darkTheme, context),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: darkTheme ? Colors.black : Colors.white,
          body: Center(
            child: FlareCacheBuilder(
              [
                AssetFlare(
                    bundle: rootBundle, name: 'animations/loadingScreen.flr')
              ],
              builder: (BuildContext context, bool isWarm) {
                return !isWarm
                    ? Container(child: spinkit)
                    : SizedBox(
                        height: 350,
                        // width: 400,
                        child: FlareActor(
                          "animations/loadingScreen.flr",
                          // alignment: Alignment.topLeft,
                          fit: BoxFit.fitHeight,
                          animation: "Untitled",
                        ),
                      );
              },
            ),
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
        ));
  }
}
