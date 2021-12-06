import 'package:flutter/material.dart';
import 'package:nepek_buyer/pages/home/tabs/home/home_provider.dart';
import 'package:nepek_buyer/pages/home/tabs/home/top_part/main.dart';
import 'package:provider/provider.dart';
import 'package:nepek_buyer/pages/home/tabs/home/appBar.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_provider.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeTabProvider(),
      child: HomeTabRoot(),
    );
  }
}

class HomeTabRoot extends StatefulWidget {
  @override
  _HomeTabRootState createState() => _HomeTabRootState();
}

class _HomeTabRootState extends State<HomeTabRoot>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final HomeTabProvider provider = Provider.of(context);
    if (!provider.initState) provider.doInitState();
    return provider.body;
  }
}

class HomeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeTabProvider provider = Provider.of(context);
    final bool darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;

    return SafeArea(
      child: Scaffold(
        // extendBodyBehindAppBar: true,
        appBar: homeAppbar(context, darkTheme),
        body: ListView(children: [
          HomeTopPart(),
        ]),
      ),
    );
  }
}
