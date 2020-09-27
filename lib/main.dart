import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'dart:async';
// import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:skite_buyer/routes/main.dart';
import 'package:skite_buyer/savedData/user_data.dart';
import 'package:skite_buyer/styles/colors.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FirebaseApp defaultApp = await Firebase.initializeApp();
  print('Firebase initialized default $defaultApp');

  if (Firebase.apps.length != 2) {
    await Firebase.initializeApp(
      name: 'Skite',
      options: const FirebaseOptions(
          appId: '1:413884093288:android:8b218ab7c4ff8c44dc3cdd',
          apiKey: 'AIzaSyAJa5T2y-k1x2da1HiUZ7MfEPP7oKde2Fw',
          messagingSenderId: '413884093288',
          projectId: 'neptune-a3815'),
    );
  }
  print(Firebase.apps);
  //Styles
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: AppColors().transparentAppbar(), //top bar color
      statusBarIconBrightness: Brightness.dark, //top bar icons
      systemNavigationBarColor: Colors.white, //bottom bar color
      systemNavigationBarIconBrightness: Brightness.dark, //bottom bar icons
    ),
  );
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then(
    (_) => runApp(RootApp()),
  );
  //HiveDB
  Directory appDocDir = await getApplicationDocumentsDirectory();
  String appDocPath = appDocDir.path;
  Hive.init(appDocPath);
  await UserPreferences().init();
}

class RootApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(primaryColor: Color(0xff256eff)),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.generateRoute,
      theme: ThemeData(
        fontFamily: 'Cabin',
        scaffoldBackgroundColor: Colors.white,
        splashColor: Colors.grey[100],
      ),
      // home: Scaffold(),
    );
  }
}
