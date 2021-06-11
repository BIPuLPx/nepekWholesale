import 'package:hive/hive.dart';
import 'package:nepek_buyer/notifications/remove_token.dart';
import 'package:nepek_buyer/savedData/user_data.dart';

signOutUser() {
  final token = UserPreferences().getdeviceTokenID();
  removeNotificationToken(token);
  final Box userDeliveryAreas = Hive.box('userDeliveryAreas');
  userDeliveryAreas.put('deliveryAreas', null);
  userDeliveryAreas.put('default_delivery_area', null);
  UserPreferences().clear();
}
