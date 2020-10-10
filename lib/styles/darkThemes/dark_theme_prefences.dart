import 'package:shared_preferences/shared_preferences.dart';

class DarkThemePreference {
  static final DarkThemePreference _instance = DarkThemePreference._ctor();
  factory DarkThemePreference() {
    return _instance;
  }

  DarkThemePreference._ctor();

  SharedPreferences _prefs;

  init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  setDarkTheme(bool value) {
    _prefs.setBool('THEME_STATUS', value);
  }

  bool getTheme() => _prefs.getBool('THEME_STATUS') ?? false;

  // prefs.getBool(THEME_STATUS)==null ? false:;
}
