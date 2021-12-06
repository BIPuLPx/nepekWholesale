import 'package:hive/hive.dart';
import 'package:nepek_buyer/notifications/remove_token.dart';
import 'package:nepek_buyer/savedData/user_data.dart';

signOutUser() {
  final token = UserPreferences().getdeviceTokenID();
  removeNotificationToken(token);
  final Box userAddress = Hive.box('userAddress');
  userAddress.put('deliveryAreas', null);
  userAddress.put('default_delivery_area', null);
  UserPreferences().clear();
}
