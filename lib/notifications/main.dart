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
      _saveNotification(message);
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
      "entity_type": "seller",
      "entity_id": UserPreferences().getBuyerKey(),
      "device_token": token
    };
    final response = await http.post(
      httpUri(peopleApi, 'sellers/device_token'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      UserPreferences().deviceToken(true);
    }
  }

  void checkTokenAdded() async {
    if (UserPreferences().getDeviceToken() == null) {
      String fcmToken = await messaging.getToken();
      _sendToBackend(fcmToken);
    }
  }
}

// class Notifications {
//   FlutterLocalNotificationjsPlugin fltNotification;
//   final messaging = FirebaseMessaging.instance;

//   void configureFcm(context) {
//     'here');
//     var androiInit = AndroidInitializationSettings('@mipmap/ic_launcher');

//     var iosInit = IOSInitializationSettings();

//     var initSetting = InitializationSettings(android: androiInit, iOS: iosInit);

//     fltNotification = FlutterLocalNotificationsPlugin();

//     fltNotification.initialize(initSetting);

//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       'Got a message whilst in the foreground!');
//       'Message data: ${message.data}');

//       if (message.notification != null) {
//         'Message also contained a notification: ${message.notification}');
//       }
//       showNotification();
//     });
//   }
//   // void configureFcm(context) {
//   //   final _navigate = Navigate(context);
//   //   configure(
//   //     onMessage: (Map<String, dynamic> message) async {
//   //       'onMessage : $message');
//   //       showDialog(
//   //         context: context,
//   //         builder: (context) => AlertDialog(
//   //           content: ListTile(
//   //             title: Text(message['notification']['title']),
//   //             subtitle: Text(message['notification']['body']),
//   //           ),
//   //           actions: <Widget>[
//   //             FlatButton(
//   //               child: Text('Ok'),
//   //               onPressed: () => Navigator.of(context).pop(),
//   //             ),
//   //           ],
//   //         ),
//   //       );
//   //     },
//   //     onLaunch: (Map<String, dynamic> message) async {
//   //       // message);
//   //       'on Launch');
//   //       _navigate.navigate(message['data']);
//   //       // Navigator.of(context).pushNamed('view_order',arguments: {"orderKey":})
//   //     },
//   //     onResume: (Map<String, dynamic> message) async {
//   //       // message);
//   //       'on Resume');
//   //       _navigate.navigate(message['data']);
//   //     },
//   //     // onBackgroundMessage:
//   //   );
//   // }

//   void showNotification() async {
//     var androidDetails =
//         AndroidNotificationDetails('1', 'channelName', 'channel Description');

//     var iosDetails = IOSNotificationDetails();

//     var generalNotificationDetails =
//         NotificationDetails(android: androidDetails, iOS: iosDetails);

//     await fltNotification.show(0, 'title', 'body', generalNotificationDetails,
//         payload: 'Notification');
//   }

//   void notitficationPermission() async {
//     NotificationSettings settings = await messaging.requestPermission(
//       alert: true,
//       announcement: false,
//       badge: true,
//       carPlay: false,
//       criticalAlert: false,
//       provisional: false,
//       sound: true,
//     );
//   }

//   void _getDeviceToken() async {

//   }
// }
