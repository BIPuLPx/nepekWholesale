// import 'dart:io';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:nepek_buyer/provider_head.dart';
import 'package:nepek_buyer/rootApp/main.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_preferences.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_provider.dart';
import 'package:nepek_buyer/savedData/user_data.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // FirebaseApp defaultApp = await Firebase.initializeApp();
  // print('Firebase initialized default $defaultApp');

  // if (Firebase.apps.length != 2) {
  //   await Firebase.initializeApp(
  //     name: 'Skite',
  //     options: const FirebaseOptions(
  //         appId: '1:413884093288:android:8b218ab7c4ff8c44dc3cdd',
  //         apiKey: 'AIzaSyAJa5T2y-k1x2da1HiUZ7MfEPP7oKde2Fw',
  //         messagingSenderId: '413884093288',
  //         projectId: 'neptune-a3815'),
  //   );
  // }
  // print(Firebase.apps);
  //Styles

  Directory appDocDir = await getApplicationDocumentsDirectory();
  String appDocPath = appDocDir.path;
  Hive.init(appDocPath);
  UserPreferences().init();
  DarkThemePreference().init();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then(
    (_) => runApp(MainApp()),
  );
  //HiveDB
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
