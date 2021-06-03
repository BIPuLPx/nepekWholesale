import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart';
import 'package:nepek_buyer/savedData/apis.dart';
import 'package:nepek_buyer/savedData/httpUri.dart';
import 'package:nepek_buyer/savedData/user_data.dart';

FirebaseMessaging messaging = FirebaseMessaging.instance;

Future _sendToBackend(String token) async {
  final data = {
    "entity_type": "buyer",
    "entity_id": UserPreferences().getBuyerKey(),
    "device_token": token
  };
  final response = await post(
    httpUri(peopleApi, 'customers/device_token'),
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(data),
  );
  if (response.statusCode == 200) {
    UserPreferences().deviceToken(true);
  }
}

void checkNotifyTokenAdded() async {
  if (UserPreferences().getDeviceToken() == null) {
    String fcmToken = await messaging.getToken();
    print(fcmToken);
    _sendToBackend(fcmToken);
  }
}
