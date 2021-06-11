// import 'dart:io';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:nepek_buyer/provider_head.dart';
import 'package:nepek_buyer/rootApp/main.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_preferences.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_provider.dart';
import 'package:nepek_buyer/savedData/user_data.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:firebase_core/firebase_core.dart';

FirebaseAnalytics analytics;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();

  UserPreferences().init().then(
        (_) => Firebase.initializeApp().then(
          (_) {
            analytics = FirebaseAnalytics();

            // Pass all uncaught errors to Crashlytics.
            FlutterError.onError =
                FirebaseCrashlytics.instance.recordFlutterError;

            Hive.init(appDocumentDir.path);
            DarkThemePreference().init();

            FirebaseMessaging.onBackgroundMessage(
                _firebaseMessagingBackgroundHandler);
            SystemChrome.setPreferredOrientations([
              DeviceOrientation.portraitUp,
              DeviceOrientation.portraitDown
            ]).then(
              (_) => runApp(MainApp()),
            );
          },
        ),
      );
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HeadProvider(),
      child: ChangeNotifierProvider(
        create: (context) => DarkThemeProvider(),
        child: RootApp(),
      ),
    );
  }
}
