import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skite_buyer/rootApp/root_app_provider.dart';
import 'package:skite_buyer/rootApp/widgets/ThemeSwitcher/main.dart';
import 'package:skite_buyer/rootApp/widgets/loadingScreen/main.dart';

class RootApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RootProvider(),
      child: RootAppWithProvider(),
    );
  }
}

class RootAppWithProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final rootProvider = Provider.of<RootProvider>(context);
    if (!rootProvider.initCheck) {
      rootProvider.initChecks();
    }
    return ThemeSwitcher(
      child: rootProvider.body,
    );
  }
}
