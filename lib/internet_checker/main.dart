import 'dart:io';
import 'package:flutter/material.dart';
import 'package:nepek_buyer/styles/button/nepek_button.dart';
import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/text/normal_text.dart';

class InternetChecker extends StatefulWidget {
  final Widget child;
  final Function retryFunction;

  const InternetChecker({Key key, this.child, this.retryFunction})
      : super(key: key);

  @override
  _InternetCheckerState createState() => _InternetCheckerState();
}

class _InternetCheckerState extends State<InternetChecker> {
  bool isInternet = true;

  List availableServers = [];

  _server(String url) async {
    try {
      final internet = await InternetAddress.lookup(url);
      availableServers.add(internet);
    } on SocketException catch (_) {
      setState(() {
        isInternet = false;
      });
    }
  }

  Future _check() async {
    _server('service01.nepek.com')
        .then((_) => _server('service02.nepek.com'))
        .then((_) {
      if (availableServers.length == 2) {
        setState(() {
          if (widget.retryFunction != null) widget.retryFunction();
          isInternet = true;
        });
      }
    });
  }

  @override
  void initState() {
    _check();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: isInternet ? widget.child : RetryInternet(retry: _check),
      ),
    );
  }
}

class RetryInternet extends StatelessWidget {
  final Function retry;
  const RetryInternet({Key key, this.retry}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset('assets/others/no_connection.png'),
          ),
          SizedBox(height: 30),
          NepekText(
            'Something went wrong',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.officialMatch,
          ),
          NepekText(
            'Please check your connection and try again',
            fontWeight: FontWeight.w500,
          ),
          SizedBox(height: 30),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: NepekButton(
              label: 'Retry',
              onClick: retry,
            ),
          ),
        ],
      ),
    );
  }
}
