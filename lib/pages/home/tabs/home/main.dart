import 'package:flutter/material.dart';
import 'package:nepek_buyer/pages/home/tabs/home/home_provider.dart';
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
    if (!provider.injected) provider.fetchData();
    return provider.screen;
  }
}

class HomeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bool darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    final HomeTabProvider provider = Provider.of(context);

    return SafeArea(
      child: Scaffold(
        // extendBodyBehindAppBar: true,
        appBar: homeAppbar(context, darkTheme),
        body: Container(
          color: Colors.white,
          child: ListView(
            shrinkWrap: true,
            // physics: BouncingScrollPhysics(),
            cacheExtent: 10,
            addAutomaticKeepAlives: true,
            children: [
              ...provider.body,
            ],
          ),
        ),
      ),
    );
  }
}
