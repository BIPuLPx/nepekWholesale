import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nepek_buyer/pages/userInfoInput/phoneNumber/phone_number_provider.dart';

class VerifyPhoneNumber extends StatelessWidget {
  final args;
  const VerifyPhoneNumber({Key key, this.args}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PhoneInputState(),
      child: VerifyPhoneNumberRoot(args: args),
    );
  }
}

class VerifyPhoneNumberRoot extends StatelessWidget {
  final args;
  const VerifyPhoneNumberRoot({Key key, this.args}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(args);
    final verifyNumber = Provider.of<PhoneInputState>(context);
    if (verifyNumber.initInject == false) {
      verifyNumber.initInjection(args);
    }
    return Container(
      child: verifyNumber.screens[verifyNumber.currentScreen],
    );
  }
}
