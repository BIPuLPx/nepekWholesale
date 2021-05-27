import 'package:hive/hive.dart';
import 'package:nepek_buyer/savedData/user_data.dart';

signOutUser() {
  final Box userDeliveryAreas = Hive.box('userDeliveryAreas');
  userDeliveryAreas.put('deliveryAreas', null);
  userDeliveryAreas.put('default_delivery_area', null);
  UserPreferences().clear();
}
