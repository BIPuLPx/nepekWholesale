import 'package:flutter/foundation.dart';
import 'package:skite_buyer/styles/darkThemes/dark_theme_prefences.dart';

class DarkThemeProvider with ChangeNotifier {
  DarkThemePreference darkThemePreference = DarkThemePreference();
  bool isInit = true;
  bool _darkTheme;

  bool get darkTheme => _darkTheme;
  // bool get darkTheme => false;

  set localTheme(bool value) {
    if (isInit) {
      _darkTheme = value;
      isInit = false;
    }
  }

  set darkTheme(bool value) {
    _darkTheme = value;
    // print(value);
    darkThemePreference.setDarkTheme(value);
    // print(darkThemePreference.getTheme());
    notifyListeners();
  }
}
