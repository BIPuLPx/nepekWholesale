import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nepek_buyer/savedData/apis.dart';
import 'package:nepek_buyer/savedData/httpUri.dart';
import 'package:nepek_buyer/savedData/user_data.dart';
import 'package:http/http.dart' as http;
import 'package:nepek_buyer/styles/popUps/loading_popup.dart';
import 'package:nepek_buyer/styles/toasts/sucess_toast.dart';

import 'screens/code_input.dart';
import 'screens/phone_number_input.dart';

class PhoneInputState extends ChangeNotifier {
//
  bool initInject = false;
  bool isNextScreenAddress;
  var argss;
  int currentScreen = 0;

  List<Widget> screens = [
    PhoneNumberInput(),
    VerCodeInput(),
  ];

  bool autovalidate = false;
  String phoneNumber;
  String verificationCode;
  dynamic verCodeid;
  final formKey = GlobalKey<FormState>();
  bool autoValidate = false;

  void initInjection(args) {
    argss = args;
    if (args == null) {
      isNextScreenAddress = false;
    } else {
      // if (args['pg'] == null) {
      //   isNextScreenAddress = args['deliveryAdd'];
      // }
    }
    initInject = false;
  }

  void phoneNumberChanged(val) {
    phoneNumber = val;
  }

  void verCodeChanged(val) {
    verificationCode = val;
  }

  Future addToBackend(BuildContext context) async {
    // print(UserPreferences().getJwtToken());
    loadingPopUP(context, "Adding phone number");
    var response = await http.put(
      httpUri(serviceOne, 'customers/addPhone'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${UserPreferences().getJwtToken()}'
      },
      body: jsonEncode({'phone': phoneNumber}),
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      UserPreferences().phoneNumber(phoneNumber);
      Navigator.of(context).pop();
      // print('here');
      sucessToast(context, 'Updated phone number');
      if (isNextScreenAddress == true) {
        Navigator.pushReplacementNamed(context, 'input_delivery_address');
      } else if (argss['pg'] != null) {
        argss['refresh']();
        Navigator.of(context).pop();
      } else {
        Navigator.of(context).pop();
      }
    }
  }

  dynamic validatePhoneNumber(String val) {
    if (val.isEmpty) {
      return 'Please provide phone number';
    } else if (RegExp(r'^[0-9]*$').hasMatch(val) == false) {
      return 'Please enter valid phone number';
    } else if (val.length != 10) {
      return 'Phone number should have length of 10';
    }
  }

  void sendPhoneNumber(BuildContext context) {
    // print(UserPreferences().getJwtToken());
    if (formKey.currentState.validate()) {
      // verifyNumber(context);
      addToBackend(context);
    } else {
      autoValidate = true;
      notifyListeners();
    }
  }
}

// Future<bool> loginUser(String phone, BuildContext context) async {
//   FirebaseAuth _auth = FirebaseAuth.instance;

//   _auth.verifyPhoneNumber(
//       phoneNumber: phone,
//       timeout: Duration(seconds: 60),
//       verificationCompleted: (AuthCredential credential) async {
//         Navigator.of(context).pop();

//         AuthResult result = await _auth.signInWithCredential(credential);

//         FirebaseUser user = result.user;

//         if (user != null) {
//           Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (context) => HomeScreen(
//                         user: user,
//                       )));
//         } else {
//           print("Error");
//         }

//         //This callback would gets called when verification is done auto maticlly
//       },
//       verificationFailed: (AuthException exception) {
//         print(exception);
//       },
//       codeSent: (String verificationId, [int forceResendingToken]) {
//         showDialog(
//             context: context,
//             barrierDismissible: false,
//             builder: (context) {
//               return AlertDialog(
//                 title: Text("Give the code?"),
//                 content: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: <Widget>[
//                     TextField(
//                       controller: _codeController,
//                     ),
//                   ],
//                 ),
//                 actions: <Widget>[
//                   FlatButton(
//                     child: Text("Confirm"),
//                     textColor: Colors.white,
//                     color: Colors.blue,
//                     onPressed: () async {
//                       final code = _codeController.text.trim();
//                       AuthCredential credential =
//                           PhoneAuthProvider.getCredential(
// verificationId: verificationId, smsCode: code);

//                       AuthResult result =
//                           await _auth.signInWithCredential(credential);

//                       FirebaseUser user = result.user;

//                       if (user != null) {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => HomeScreen(
//                                       user: user,
//                                     )));
//                       } else {
//                         print("Error");
//                       }
//                     },
//                   )
//                 ],
//               );
//             });
//       },
//       codeAutoRetrievalTimeout: null);
// }
