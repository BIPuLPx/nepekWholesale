import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:nepek_buyer/savedData/apis.dart';
import 'package:nepek_buyer/savedData/httpUri.dart';
import 'package:nepek_buyer/savedData/user_data.dart';
import 'navigate.dart';
import 'on_message_popup.dart';

class Notifications extends StatefulWidget {
  final Widget child;

  const Notifications({Key key, this.child}) : super(key: key);
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  BuildContext thisContext;

  @override
  void initState() {
    notitficationPermission();
    initMessaging();
    checkTokenAdded();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      thisContext = context;
    });
    return widget.child;
  }

  void initMessaging() {
    final notificationBox = Hive.box('notifications');

    Future _navigate(Map data) {
      final Navigate _nav = Navigate(thisContext);
      if (data['page'] != null) _nav.navigate(data);
      return null;
    }

    _saveNotification(RemoteMessage message) {
      RemoteNotification notification = message.notification;
      notificationBox.add({
        "title": notification.title,
        "body": notification.body,
        "data": message.data
      });
    }

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _saveNotification(message);
      onMessagePopUp(
        thisContext,
        message.data,
        message.notification.title,
        message.notification.body,
      );
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      _navigate(message.data);
    });

    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage message) {
      if (message != null) {
        _saveNotification(message);
        _navigate(message.data);
      }
    });
  }

  void notitficationPermission() async {
    await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }

  Future _sendToBackend(String token) async {
    final data = {
      "entity_type": "buyer",
      "entity_id": UserPreferences().getBuyerKey(),
      "device_token": token
    };
    final response = await http.post(
      httpUri(serviceOne, 'customers/device_token'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      UserPreferences().deviceToken(true);
      UserPreferences().deviceTokenID(token);
    }
  }

  void checkTokenAdded() async {
    if (UserPreferences().getDeviceToken() == null &&
        UserPreferences().getLoggedIn() == true) {
      String fcmToken = await messaging.getToken();
      _sendToBackend(fcmToken);
    }
  }
}
