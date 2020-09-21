import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static final UserPreferences _instance = UserPreferences._ctor();
  factory UserPreferences() {
    return _instance;
  }

  UserPreferences._ctor();

  SharedPreferences _prefs;

  init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  jwtToken(String value) {
    _prefs.setString('jwtToken', value);
  }

  getJwtToken() => _prefs.getString('jwtToken');

  displayName(String value) {
    _prefs.setString('displayName', value);
  }

  getDisplayName() => _prefs.getString('displayName');

  buyerKey(String value) {
    _prefs.setString('buyerKey', value);
  }

  getBuyerKey() => _prefs.getString('buyerKey');

  phoneNumber(String value) {
    _prefs.setString('phoneNumber', value);
  }

  getphoneNumber() => _prefs.getString('phoneNumber');

  state(String value) {
    _prefs.setString('state', value);
  }

  getState() => _prefs.getString('state');

  district(String value) {
    _prefs.setString('district', value);
  }

  getDistrict() => _prefs.getString('district');

  area(String value) {
    _prefs.setString('area', value);
  }

  getarea() => _prefs.getString('area');

  // email(String val) {
  //   _prefs.setString('email', val);
  // }

  // getEmail() => _prefs.getString('email');

  loggedIn(bool val) {
    _prefs.setBool('loggedIn', val);
  }

  getLoggedIn() => _prefs.getBool('loggedIn');
}
