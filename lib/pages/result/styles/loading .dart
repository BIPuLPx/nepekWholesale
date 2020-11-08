import 'package:flutter/material.dart';
import 'package:nepek_buyer/styles/spinkit.dart';

class LoadingResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: spinkit,
        ),
      ),
    );
  }
}
