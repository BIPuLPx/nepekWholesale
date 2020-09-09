import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skite_buyer/routes/main.dart';
import 'package:skite_buyer/styles/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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

  // await UserPreferences().init();
  // final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  // Hive.init(appDocumentDir.path);
}

class RootApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(primaryColor: Color(0xff256eff)),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
