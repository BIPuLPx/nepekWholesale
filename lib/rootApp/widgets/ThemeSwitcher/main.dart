import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:provider/provider.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_prefences.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_provider.dart';

class ThemeSwitcher extends StatefulWidget {
  final Widget child;

  const ThemeSwitcher({Key key, this.child}) : super(key: key);
  @override
  _ThemeSwitcherState createState() => _ThemeSwitcherState();
}

class _ThemeSwitcherState extends State<ThemeSwitcher>
    with WidgetsBindingObserver {
  bool _useWhiteStatusBarForeground;
  bool _useWhiteNavigationBarForeground;
  bool darkModeOn;

  @override
  initState() {
    WidgetsBinding.instance.addObserver(this);
    var brightness = SchedulerBinding.instance.window.platformBrightness;
    setState(() {
      darkModeOn = brightness == Brightness.dark;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final darktheme = Provider.of<DarkThemeProvider>(context);
    darktheme.localTheme = DarkThemePreference().getTheme();
    changeStatusAndNavBarColor(
        darktheme.darkTheme ? Colors.black : Colors.white);
    return widget.child;
  }

  @override
  dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      if (_useWhiteStatusBarForeground != null)
        FlutterStatusbarcolor.setStatusBarWhiteForeground(
            _useWhiteStatusBarForeground);
      if (_useWhiteNavigationBarForeground != null)
        FlutterStatusbarcolor.setNavigationBarWhiteForeground(
            _useWhiteNavigationBarForeground);
    }
    super.didChangeAppLifecycleState(state);
  }

  changeStatusAndNavBarColor(Color color) async {
    try {
      if (color == Colors.black) {
        FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
        FlutterStatusbarcolor.setNavigationBarWhiteForeground(true);
        _useWhiteStatusBarForeground = true;
        _useWhiteNavigationBarForeground = true;
      } else {
        FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
        FlutterStatusbarcolor.setNavigationBarWhiteForeground(false);
        _useWhiteStatusBarForeground = false;
        _useWhiteNavigationBarForeground = false;
      }
      if (Platform.isAndroid) {
        changeNavigationColor(color);
      }
      await FlutterStatusbarcolor.setStatusBarColor(color, animate: true);
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    }
  }

  changeNavigationColor(Color color) async {
    try {
      await FlutterStatusbarcolor.setNavigationBarColor(color, animate: true);
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    }
  }
}
