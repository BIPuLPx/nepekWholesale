import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skite_buyer/pages/userInfoInput/phoneNumber/phone_number_provider.dart';
import 'package:skite_buyer/styles/colors.dart';
import 'package:skite_buyer/styles/font_styles.dart';

class PhoneNumberInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PhoneNumberHeading(heading: 'Your Phone Number'),
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
        style: GoogleFonts.cabin(
          fontSize: 22,
          fontWeight: FontWeight.w800,
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
            color: AppColors().primaryBlue(),
            spreadRadius: 0.2,
            blurRadius: 2,
          ),
        ],
      ),
      padding: EdgeInsets.only(top: 10, bottom: 10),
      margin: EdgeInsets.only(left: 2, right: 2),
      child: TextFormField(
        onChanged: (value) => phonenumber.phoneNumberChanged(value),
        validator: (value) => phonenumber.validatePhoneNumber(value),
        decoration: InputDecoration(
            errorStyle: errorStyle(),
            border: InputBorder.none,
            hintText: '98........',
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
      key: phonenumber.formKey,
      autovalidate: phonenumber.autoValidate,
      child: Column(
        children: [
          InputNumber(),
          SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: FlatButton(
                color: AppColors().primaryBlue(),
                onPressed: () {
                  phonenumber.sendPhoneNumber(context);
                },
                child: Text(
                  'Send',
                  style: AppFontStyle().button(Colors.white),
                )),
          )
        ],
      ),
    );
  }
}

TextStyle inputPhoneNumberStyle() => GoogleFonts.cabin(
      fontWeight: FontWeight.w600,
      fontSize: 18,
    );
TextStyle errorStyle() => TextStyle(fontSize: 11);
