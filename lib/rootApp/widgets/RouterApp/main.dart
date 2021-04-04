import 'package:flutter/material.dart';
import 'package:nepek_buyer/styles/remove_glow.dart';
import 'package:provider/provider.dart';
import 'package:nepek_buyer/routes/main.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_provider.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_styles.dart';
// import 'package:nepek_buyer/styles/remove_glow.dart';

class RouterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bool darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    return MaterialApp(
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: MyBehavior(),
          child: child,
        );
      },
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.generateRoute,
      theme: Styles.themeData(darkTheme, context),
    );
  }
}
