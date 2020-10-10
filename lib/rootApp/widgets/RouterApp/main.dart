import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skite_buyer/routes/main.dart';
import 'package:skite_buyer/styles/darkThemes/dark_theme_provider.dart';
import 'package:skite_buyer/styles/darkThemes/dark_theme_styles.dart';

class RouterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bool darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.generateRoute,
      theme: Styles.themeData(darkTheme, context),
    );
  }
}
