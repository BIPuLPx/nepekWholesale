import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nepek_buyer/styles/colors.dart';
import 'appBars/default_app_bar.dart';

final spinkit = SpinKitThreeBounce(
  color: AppColors.officialMatch,
  size: 20.0,
);
Widget logoLoader() => Container(
      color: Colors.white,
      child: Center(
        child: spinkit,
        // child: NepekLogoLoader(
        //   size: 200,
        // ),
      ),
    );

class LoaderWithAppBar extends StatelessWidget {
  const LoaderWithAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: defaultAppBar(context, '', false),
      body: spinkit,
    );
  }
}
