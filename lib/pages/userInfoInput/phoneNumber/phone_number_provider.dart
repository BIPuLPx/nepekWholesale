import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:skite_buyer/pages/userInfoInput/phoneNumber/dialogs/sending_code.dart';
import 'package:skite_buyer/pages/userInfoInput/phoneNumber/dialogs/wrong_ver_code.dart';
import 'package:skite_buyer/pages/userInfoInput/phoneNumber/screens/code_input.dart';
import 'package:skite_buyer/pages/userInfoInput/phoneNumber/screens/phone_number_input.dart';
import 'package:skite_buyer/savedData/apis.dart';
import 'package:skite_buyer/savedData/user_data.dart';
import 'package:http/http.dart' as http;
import 'package:skite_buyer/styles/toast.dart';

class PhoneInputState extends ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;
//
  bool initInject = false;
  bool isNextScreenAddress;
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
    if (args == null) {
      isNextScreenAddress = false;
    } else {
      isNextScreenAddress = args['deliveryAdd'];
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
    print(UserPreferences().getJwtToken());
    var response = await http.put(
      '$peopleApi/customers/addPhone',
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
      showToast(context, 'Sucessfully added your phone number');
      if (isNextScreenAddress == true) {
        Navigator.pushReplacementNamed(context, 'input_delivery_address');
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
      verifyNumber(context);
    } else {
      autoValidate = true;
      notifyListeners();
    }
  }

  Future verifyCode(BuildContext context) async {
    sendingCode(context);
    AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verCodeid, smsCode: verificationCode);
    try {
      final result = await _auth.signInWithCredential(credential);
      final user = result.user;
      // print(user);
      // print('verified');
      if (user.phoneNumber == '+977$phoneNumber') {
        // print('verified');
        addToBackend(context);
      }
    } catch (e) {
      print(e.code);
      if (e.code == 'invalid-verification-code') {
        Navigator.of(context).pop();
        codeExceptions(
            context, "The verification code is invalid, please try again ");
      }

      // PlatformException(code: '');
      // Navigator.of(context).pop();
      // wrongCode(context);
      // print(e);
    }
  }

  Future verifyNumber(BuildContext context) async {
    print('here');
    print(phoneNumber);
    sendingCode(context);

    await _auth.verifyPhoneNumber(
        phoneNumber: '+977$phoneNumber',
        verificationCompleted: (AuthCredential credential) async {
          // Navigator.of(context).pop();

          final result = await _auth.signInWithCredential(credential);

          final user = result.user;
          print(user);

          if (user != null) {
            print(user);
          } else {
            print("Error");
          }
          //This callback would gets called when verification is done auto maticlly
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.toString());
          print('failed');
          // print(e.code);
          // if(e.code ==
          if (e.code == 'invalid-verification-code') {
            print('The provided phone number is not valid.');
          }
        },
        codeSent: (String verificationId, int resendToken) {
          verCodeid = verificationId;
          Navigator.of(context).pop();
          currentScreen = 1;
          notifyListeners();
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          print('timeOut');
        },
        timeout: Duration(seconds: 60));
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
