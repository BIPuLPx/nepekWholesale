import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/font_styles.dart';

import '../../appBar.dart';
import '../phone_number_provider.dart';

class VerCodeInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: userInputAppbar(context),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PhoneNumberHeading(heading: 'Please enter the code'),
              SizedBox(height: 20),
              InputNumberForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class PhoneNumberHeading extends StatelessWidget {
  final String heading;
  PhoneNumberHeading({this.heading});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        heading,
        style: GoogleFonts.poppins(
          fontSize: 22,
          fontWeight: FontWeight.w700,
          height: 1.5,
        ),
      ),
    );
  }
}

class InputNumber extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final phonenumber = Provider.of<PhoneInputState>(context);

    return Container(
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors().officialMatch(),
            spreadRadius: 0.2,
            blurRadius: 2,
          ),
        ],
      ),
      padding: EdgeInsets.only(top: 10, bottom: 10),
      margin: EdgeInsets.only(left: 2, right: 2),
      child: TextFormField(
        onChanged: (value) => phonenumber.verCodeChanged(value),
        // validator: (value) => phonenumber.validatePhoneNumber(value),
        decoration: InputDecoration(
            errorStyle: errorStyle(),
            border: InputBorder.none,
            hintText: 'Enter your code here',
            contentPadding: EdgeInsets.only(left: 20, right: 20, bottom: 3),
            hintStyle: inputPhoneNumberStyle()),
        keyboardType: TextInputType.number,
        style: inputPhoneNumberStyle(),
      ),
    );
  }
}

class InputNumberForm extends StatelessWidget {
  Widget build(BuildContext context) {
    final phonenumber = Provider.of<PhoneInputState>(context);
    return Form(
      // key: phonenumber.formKey,
      // autovalidate: phonenumber.autoValidate,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InputNumber(),
          SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: FlatButton(
                color: AppColors().officialMatch(),
                onPressed: () {
                  // phonenumber.verifyCode(context);
                },
                child: Text(
                  'Verify',
                  style: AppFontStyle().button(Colors.white),
                )),
          ),
          CountdownTimer()
        ],
      ),
    );
  }
}

class CountdownTimer extends StatefulWidget {
  @override
  _CountdownTimerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  Timer timer;
  int _start = 60;

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          // print('here');
          if (_start < 1) {
            timer.cancel();
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _start == 0
              ? RaisedButton(
                  color: Colors.white,
                  onPressed: () {},
                  child: Text(
                    'Resend Code',
                    style: resendStyle(),
                  ),
                )
              : Text(
                  'Resend code in ${_start.toString()} seconds',
                  style: countDownStyle(),
                ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}

TextStyle countDownStyle() => GoogleFonts.openSans(
      fontWeight: FontWeight.w600,
      color: AppColors().secondaryText(),
      fontStyle: FontStyle.italic,
    );
TextStyle resendStyle() => GoogleFonts.rubik(
      color: AppColors().officialMatch(),
      fontSize: 14.5,
      fontWeight: FontWeight.w500,
    );

TextStyle inputPhoneNumberStyle() => GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
      fontSize: 18,
    );
TextStyle errorStyle() => TextStyle(fontSize: 11);
