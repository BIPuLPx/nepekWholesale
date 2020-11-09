import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_provider.dart';
import 'package:nepek_buyer/styles/font_styles.dart';

import '../../appBar.dart';
import '../phone_number_provider.dart';

class PhoneNumberInput extends StatelessWidget {
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
    final isdark = Provider.of<DarkThemeProvider>(context).darkTheme;

    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1),
        color: isdark ? Colors.grey[800] : Colors.grey[200],
      ),
      child: TextFormField(
        onChanged: (value) => phonenumber.phoneNumberChanged(value),
        validator: (value) => phonenumber.validatePhoneNumber(value),
        decoration: InputDecoration(
          labelText: "98..",
        ),
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

TextStyle inputPhoneNumberStyle() => GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
      fontSize: 18,
    );
TextStyle errorStyle() => TextStyle(fontSize: 11);
