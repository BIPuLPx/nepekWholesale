import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nepek_buyer/savedData/apis.dart';
import 'package:nepek_buyer/savedData/httpUri.dart';
import 'package:nepek_buyer/styles/popUps/errorPopUp.dart';
import 'package:nepek_buyer/styles/popUps/loading_popup.dart';
import 'package:nepek_buyer/styles/popUps/sucessPopup.dart';

import 'validators.dart';

class SignUpWithEmailProvider with ChangeNotifier {
  final _validators = Validators();
  final formKey = GlobalKey<FormState>();
  bool autovalidate = false;
  String name;
  String email;
  String password;
  String rePassword;

  void signUp(BuildContext context) {
    if (formKey.currentState.validate()) {
      signUpBackend(context);
    } else {
      autovalidate = true;
    }
    notifyListeners();
  }

  Future signUpBackend(BuildContext context) async {
    loadingPopUP(context, 'Creating Account');
    final data = {"displayName": name, "email": email, "password": password};

    final response = await http.post(
      httpUri(serviceOne, 'customers/signup'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      Navigator.of(context).pop();
      Navigator.of(context).pop();
      sucessFulPopup(context, "Account created sucessfully");
    } else if (response.statusCode == 203) {
      Navigator.of(context).pop();
      errorPopup(context, "Email already exists,\nEnter a new one");
    }
  }

  void valChanged(String type, String val) {
    if (type == "name") {
      name = val;
    } else if (type == "email") {
      email = val;
    } else if (type == 'password1') {
      password = val;
    } else if (type == 'password2') {
      rePassword = val;
    }
  }

  String validateName(val) => _validators.validateName(val);
  String validateEmail(val) => _validators.validateEmail(val);
  String validatePassword(val) =>
      _validators.validatePassword(val, password, rePassword);
}
