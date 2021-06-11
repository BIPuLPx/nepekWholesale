import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nepek_buyer/styles/appBars/default_app_bar.dart';
import 'package:nepek_buyer/styles/loaders/nepek_logo_loader.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NepekWebView extends StatefulWidget {
  final Map args;
  const NepekWebView({Key key, this.args}) : super(key: key);

  @override
  _NepekWebViewState createState() => _NepekWebViewState();
}

class _NepekWebViewState extends State<NepekWebView> {
  bool isLoading = true;
  final _key = UniqueKey();
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context, widget.args['title'], false),
      body: Stack(
        children: <Widget>[
          WebView(
            key: _key,
            initialUrl: widget.args['url'],
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (finish) {
              setState(() {
                isLoading = false;
              });
            },
          ),
          isLoading
              ? Center(
                  child: NepekLogoLoader(
                    size: 50,
                  ),
                )
              : Stack(),
        ],
      ),
    );
  }
}
