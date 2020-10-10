import 'package:shared_preferences/shared_preferences.dart';

class ChangedData {
  static final ChangedData _instance = ChangedData._ctor();
  factory ChangedData() {
    return _instance;
  }

  ChangedData._ctor();

  SharedPreferences _prefs;

  init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  set deliveryAddressChanged(String value) =>
      _prefs.setString('deliveryAddress', value);

  get deliveryAddressChanged => _prefs.getString('deliveryAddress');
}
