import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skite_buyer/pages/home/tabs/profile/profile_provider.dart';
import 'package:skite_buyer/pages/home/tabs/profile/widgets/not_sigin_in/not_signed_in_provider.dart';
import 'package:skite_buyer/savedData/user_data.dart';

class NotSignedIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NotSignedInState>(
      create: ((context) => NotSignedInState()),
      child: NotSignedInRoot(),
    );
  }
}

class NotSignedInRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final signin = Provider.of<NotSignedInState>(context);
    final profile = Provider.of<ProfileState>(context);

    if (signin.initState == false) {
      signin.checkLogged = profile.checkLogged;
    }

    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NotSignedInHeading(text: 'You are not Signed In', fontSize: 25),
          NotSignedInHeading(text: 'Please Continue,', fontSize: 20),
          SignInButton(
            label: 'Continue with Facebook',
            labelColor: Color.fromRGBO(9, 126, 235, 1),
            imgPath: 'icons/Facebook.png',
            iconSize: 30,
            signinFn: signin.signInWithFacebook,
          ),
          SignInButton(
            label: 'Continue with Google',
            labelColor: Color.fromRGBO(234, 67, 53, 1),
            imgPath: 'icons/Google.png',
            iconSize: 30,
            signinFn: profile.checkLogged,
          ),
          //           SignInButton(
          //   label: 'Continue with Apple',
          //   labelColor: Color.fromRGBO(63, 66, 80, 1),
          //   imgPath: 'icons/Email.png',
          //   iconSize: 20,
          // ),
          SignInButton(
            label: 'Continue with Email',
            labelColor: Color.fromRGBO(63, 66, 80, 1),
            imgPath: 'icons/Email.png',
            iconSize: 20,
          )
        ],
      ),
    );
  }
}

class SignInButton extends StatelessWidget {
  final String label;
  final String imgPath;
  final Color labelColor;
  final double iconSize;
  final Function signinFn;
  const SignInButton(
      {Key key,
      this.label,
      this.imgPath,
      this.labelColor,
      this.iconSize,
      this.signinFn})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: RaisedButton(
        color: Colors.white,
        onPressed: () {
          signinFn(context);
          // signinFn();
        },
        child: Container(
          padding: EdgeInsets.only(
            // top: 15,
            // bottom: 15,
            left: 20,
            right: 20,
          ),
          width: double.infinity,
          height: 55,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                imgPath,
                height: iconSize,
                // color: Colors.green,
              ),
              SizedBox(width: 60),
              Text(
                label,
                style: GoogleFonts.cabin(
                  color: labelColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class NotSignedInHeading extends StatelessWidget {
  final String text;
  final double fontSize;

  const NotSignedInHeading({Key key, this.text, this.fontSize})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: GoogleFonts.cabin(
            fontSize: fontSize, fontWeight: FontWeight.w800, height: 1.5),
      ),
    );
  }
}
