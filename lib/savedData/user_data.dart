import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static final UserPreferences _instance = UserPreferences._ctor();
  factory UserPreferences() {
    return _instance;
  }

  UserPreferences._ctor();

  SharedPreferences _prefs;

  clear() {
    _prefs.clear();
  }

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

  customerKey(String value) {
    _prefs.setString('customerKey', value);
  }

  getBuyerKey() => _prefs.getString('customerKey');

  email(String value) {
    _prefs.setString('email', value);
  }

  getEmail() => _prefs.getString('email');

  phoneNumber(String value) {
    _prefs.setString('phoneNumber', value);
  }

  getphoneNumber() => _prefs.getString('phoneNumber');

  // area1(String value) {
  //   _prefs.setString('area1', value);
  // }

  // getArea1() => _prefs.getString('area1');

  // area2(String value) {
  //   _prefs.setString('area2', value);
  // }

  // getArea2() => _prefs.getString('area2');

  // area3(String value) {
  //   _prefs.setString('area3', value);
  // }

  // getArea3() => _prefs.getString('area3');

  // email(String val) {
  //   _prefs.setString('email', val);
  // }

  // getEmail() => _prefs.getString('email');

  loggedIn(bool val) {
    _prefs.setBool('loggedIn', val);
  }

  getLoggedIn() => _prefs.getBool('loggedIn');

  deviceToken(bool val) {
    _prefs.setBool('deviceToken', val);
  }

  getDeviceToken() => _prefs.getBool('deviceToken');
  pKey(String type) {
    _prefs.setString('pKey', type);
  }

  getPkey() => _prefs.getString('pKey');

  deviceTokenID(String type) {
    _prefs.setString('deviceTokenID', type);
  }

  getdeviceTokenID() => _prefs.getString('deviceTokenID');
}
