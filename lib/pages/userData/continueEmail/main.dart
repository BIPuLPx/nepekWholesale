import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:nepek_buyer/styles/appBars/default_app_bar.dart';
import 'package:nepek_buyer/styles/colors.dart';
import 'package:nepek_buyer/styles/darkThemes/dark_theme_provider.dart';
import 'package:nepek_buyer/styles/text/textInput.dart';

import 'continue_email_provider.dart';

class ContinueWithEmail extends StatelessWidget {
  final args;
  const ContinueWithEmail({Key key, this.args}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ContinueWithEmailProvider(),
      child: ContinueWithEmailRoot(args: args),
    );
  }
}

class ContinueWithEmailRoot extends StatelessWidget {
  final args;
  const ContinueWithEmailRoot({Key key, this.args}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // print(args);
    final bool darkTheme = Provider.of<DarkThemeProvider>(context).darkTheme;
    final provider = Provider.of<ContinueWithEmailProvider>(context);
    if (provider.initState == false) {
      provider.refresh = args['refresh'];
      provider.thirdPartyRoute = args['thirdPartyRoute'];
      provider.initState = true;
    }
    return Scaffold(
      appBar: defaultAppBar(context, 'Continue with email', darkTheme),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: ListView(
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            children: [
              SizedBox(height: 100),
              Text(
                'Enter your credentials',
                style: GoogleFonts.poppins(
                  fontSize: 23,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 20),
              TextInput(
                labelText: "Email",
                onChanged: (val) => provider.inputChanged('email', val),
              ),
              TextInput(
                labelText: "Password",
                obscureText: true,
                onChanged: (val) => provider.inputChanged('password', val),
              ),
              SizedBox(height: 15),
              _signinBtn(darkTheme, provider, context),
              _forgotPwd(darkTheme),
              _signUp(darkTheme, context)
            ],
          ),
        ),
      ),
    );
  }

  Container _signUp(bool darkTheme, BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Don't have an account?",
            style: _textStyle(false, darkTheme),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed('sign_up_with_email');
            },
            child: Text(
              'Sign up',
              style: _textStyle(true, darkTheme),
            ),
          ),
        ],
      ),
    );
  }

  Align _forgotPwd(bool darkTheme) {
    return Align(
      alignment: Alignment.bottomRight,
      child: TextButton(
        onPressed: () {},
        child: Text(
          'Forgot Password ?',
          style: GoogleFonts.poppins(
            fontSize: 12,
            color: darkTheme ? Colors.white : AppColors().primaryBlue(),
          ),
        ),
      ),
    );
  }

  Container _signinBtn(bool darkTheme, provider, context) {
    return Container(
      height: 50,
      width: double.infinity,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        color: darkTheme ? Colors.white : AppColors().primaryBlue(),
        onPressed: () {
          provider.signIn(context);
        },
        child: Text(
          'Sign in',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: darkTheme ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }

  TextStyle _textStyle(bool isBold, bool darkTheme) => GoogleFonts.poppins(
        fontWeight: isBold ? FontWeight.w700 : null,
        color: isBold
            ? darkTheme
                ? Colors.white
                : AppColors().primaryBlue()
            : null,
      );
}
