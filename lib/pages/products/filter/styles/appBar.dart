import 'package:nepek_buyer/styles/appBars/default_app_bar.dart';
import 'package:provider/provider.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_provider.dart';

filterAppBar(context) {
  final darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;
  return defaultAppBar(context, 'Filter', darkTheme);
}
