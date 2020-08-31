import 'package:flutter/material.dart';
import 'package:skite_buyer/styles/appBars/home.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: homeAppbar(context),
        body: Container(
          child: ListView(
            children: [
              Text('Home'),
              Container(height: 150, color: Colors.redAccent),
              SizedBox(height: 50),
              Container(height: 150, color: Colors.redAccent),
              SizedBox(height: 50),
              Container(height: 150, color: Colors.redAccent),
              SizedBox(height: 50),
              Container(height: 150, color: Colors.redAccent),
              SizedBox(height: 50),
              Container(height: 150, color: Colors.redAccent),
              SizedBox(height: 50),
              Container(height: 150, color: Colors.redAccent),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
